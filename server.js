const express = require('express');
const mysql = require('mysql2');
const jwt = require('jsonwebtoken'); 
const cron = require('node-cron');
// Set up the database connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'db_project'
});

// Connect to the database
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL');
});
//newly added below 2
const session = require('express-session');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;
const cors = require('cors');
//app.use(cors());
//app.use('/admins', ensureAdmin, adminRoutes);
// Allow requests from localhost:5500
const allowedOrigins = ['http://127.0.0.1:5500/main.html','http://127.0.0.1:5500/user_logs.html','http://localhost:5500/Admin_management','http://localhost:5500','http://127.0.0.1:5500','http://127.0.0.1:5500/Admin_management', 'http://localhost:3000/login'];

app.use(cors({
  origin: (origin, callback) => {
    if (!origin || allowedOrigins.includes(origin)) {
      callback(null, true);
    } else {
      callback(new Error('Not allowed by CORS'));
    }
  },
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  credentials: true // If using cookies or authorization headers
}));


app.use(express.json()); // Middleware to parse JSON request bodies


//below
app.use(bodyParser.urlencoded({ extended: true }));

// Set up the session middleware
app.use(session({
  secret: 'mySecretKey12345!@#', // replace with a secure, random string in production
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false } // Set `secure: true` if using HTTPS
}));



//login route
app.post('/login', (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ error: 'Email and password are required' });
  }

  // Query to get user details from the users table
  const userQuery = 'SELECT user_id, password, user_category FROM users WHERE email = ?';
  connection.query(userQuery, [email], (err, userResults) => {
    if (err) {
      console.error('Error querying users table:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    // Check if the email exists in users table
    if (userResults.length > 0) {
      // Check if the password matches for the user (use bcrypt to compare hashes in real scenarios)
      if (userResults[0].password !== password) {
        return res.status(401).json({ error: 'Invalid credentials' });
      }

      const userId = userResults[0].user_id;
      const userCategory = userResults[0].user_category;  // Retrieve user category

      // Generate a JWT token for the user
      const token = jwt.sign(
        { userId: userId, role: 'user' },  // Payload (user data)
        'mySecretKey12345!@#',  // Secret key (use a .env variable in production)
        { expiresIn: '1h' }  // Token expiration time
      );

      // Store user_id and role in session
      req.session.user_id = userId;
      req.session.role = 'user';

      return res.json({
        message: 'Login successful',
        token: token,
        role: 'user',
        userCategory: userCategory, // Include user_category in response
        userId: userId // Include userId in response
      });
    }

    // If the email is not found in users table, check the admins table
    const adminQuery = 'SELECT admin_id, password FROM admins WHERE email = ?';
    connection.query(adminQuery, [email], (err, adminResults) => {
      if (err) {
        console.error('Error querying admins table:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      // Check if the email exists in the admins table
      if (adminResults.length === 0) {
        return res.status(401).json({ error: 'Invalid credentials' });
      }

      // Check if the password matches for the admin
      if (adminResults[0].password !== password) {
        return res.status(401).json({ error: 'Invalid credentials' });
      }

      const adminId = adminResults[0].admin_id;

      // Generate a JWT token for the admin
      const token = jwt.sign(
        { userId: adminId, role: 'admin' },  // Payload (admin data)
        'mySecretKey12345!@#',  // Secret key (use a .env variable in production)
        { expiresIn: '1h' }  // Token expiration time
      );

      // Store admin_id and role in session
      req.session.user_id = adminId;
      req.session.role = 'admin';

      return res.json({
        message: 'Login successful',
        token: token,
        role: 'admin',
        userCategory: 'admin',  // Admin has a default category
        userId: adminId // Include adminId in response
      });
    });
  });
});


// Endpoint to get countries from the database
app.get('/api/countries', (req, res) => {
  const query = 'SELECT country_name FROM countries';
  
  connection.query(query, (err, results) => {
      if (err) {
          console.error('Error fetching countries:', err);
          return res.status(500).json({ error: 'Failed to fetch countries' });
      }
      res.json(results);
  });
});




function getUserCategoryByEmail(email) {
  return new Promise((resolve, reject) => {
    // Call the stored procedure
    connection.execute(
      'CALL GetUserCategoryByEmail(?)', [email],
      (err, results) => {
        if (err) {
          reject(err);
        } else {
          // Assuming the result is in the first element of the results array
          resolve(results[0]);
        }
      }
    );
  });
}


// Middleware to check if user is logged in
function ensureAuthenticated(req, res, next) {
  if (req.session.user_id) {
    next();
  } else {
    res.status(401).json({ error: 'Unauthorized: Please log in' });
  }
}

/*function ensureAdmin(req, res, next) {
  const role = req.headers.authorization;
  console.log("hiiiii:",req.session.role);
  if (req.session.role === 'admin' || req.session.role === 'Admin' ) {
    return next();
  } else {
    return res.status(403).json({ error: 'Forbidden: Admins only' });
  }
}*/


function ensureAdmin(req, res, next) {
  const token = req.headers.authorization?.split(' ')[1];  // Extract the token from the Authorization header
  if (!token) {
      return res.status(403).json({ error: 'No token provided' });
  }

  // Verify and decode the token
  jwt.verify(token, 'mySecretKey12345!@#', (err, decoded) => {
      if (err) {
          return res.status(403).json({ error: 'Invalid token' });
      }

      // Check the role in the decoded token
      if (decoded.role === 'admin') {
          return next();
      } else {
          return res.status(403).json({ error: 'Forbidden: Admins only' });
      }
  });
}

app.get('/users/subscription-plan', (req, res) => {
  const email = req.query.email; // Extract email from query parameters

  if (!email) {
      return res.status(400).json({ error: 'Email is required' });
  }

  // SQL query to call the stored procedure
  const query = `CALL GetUserCategoryByEmail(?)`;

  connection.query(query, [email], (dbErr, results) => {
    if (dbErr) {
        console.error('Error calling stored procedure:', dbErr);
        return res.status(500).json({ error: 'Internal server error' });
    }

    if (results.length === 0 || !results[0][0].user_category) {
        return res.status(404).json({ message: 'No user found with this email' });
    }

    const userCategory = results[0][0].user_category;

    // Send only the user category as a response
    res.json({ user_category: userCategory });
});
});


app.get('/user-logs', ensureAdmin, (req, res) => {
  const query = 'SELECT * FROM user_logs ORDER BY action_time DESC'; // Fetch logs ordered by timestamp

  connection.query(query, (err, results) => {
      if (err) {
          console.error('Error fetching user logs:', err);
          return res.status(500).json({ error: 'Internal server error' });
      }
      res.json(results); // Return the logs directly in the response
  });
});


// Logout endpoint to destroy the session
app.post('/logout', (req, res) => {
  req.session.destroy(err => {
    if (err) return res.status(500).json({ error: 'Failed to log out' });
    res.json({ message: 'Logged out successfully' });
  });
});


//upppppppppppppppppppppppppppppppp



app.get('/admins', ensureAdmin, (req, res) => {
  const query = 'SELECT * FROM admins';
  connection.query(query, (err, results) => {
      if (err) {
          console.error('Error fetching data:', err);
          return res.status(500).json({ error: 'Internal server error' });
      }
      res.json(results); // Return the results directly
  });
});

// Route to register new admins, accessible only by admins
app.post('/register-admins',  ensureAdmin, (req, res) => {
  const { email, password, username, role } = req.body;

  if (!email || !password || !username || !role) {
      return res.status(400).json({ error: 'All fields are required' });
  }

  const query = `
      INSERT INTO admins (email, password, username, role)
      VALUES (?, ?, ?, ?)
  `;
  connection.query(query, [email, password, username, role], (err, results) => {
      if (err) {
          console.error('Error inserting data:', err);
          return res.status(500).json({ error: 'Internal server error' });
      }
      res.json({ message: 'Admin added successfully' });
  });
});


// Endpoint to delete an admin by ID (only accessible by admins)
app.delete('/delete-admin/:adminId', ensureAdmin, (req, res) => {
  const adminId = req.params.adminId;

  const deleteQuery = 'DELETE FROM admins WHERE admin_id = ?';
  connection.query(deleteQuery, [adminId], (err, results) => {
    if (err) {
      console.error('Error deleting admin:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    if (results.affectedRows === 0) {
      return res.status(404).json({ message: 'Admin not found' });
    }

    res.json({ message: 'Admin deleted successfully' });
  });
});




// Endpoint to search for a compromised account and generate a report             //CHECKED
app.get('/compromised-account', (req, res) => {
  const emailToSearch = req.query.email;

  if (!emailToSearch) {
    return res.status(400).json({ error: 'Email is required' });
  }

  const query = `
    SELECT 
    compromised_account.email,
    compromised_account.password_hash,
    breaches.name AS breach_name,
    breaches.date AS breach_date,
    breaches.description AS breach_description,
    breach_types.type_name AS breach_type,
    breach_data_sources.source_name AS breach_source,
    COUNT(breaches.breach_id) AS breach_count
  FROM compromised_account
  JOIN breaches ON compromised_account.breach_id = breaches.breach_id
  LEFT JOIN breach_types ON breaches.type_id = breach_types.type_id
  LEFT JOIN breach_data_sources ON breaches.source_id = breach_data_sources.source_id
  WHERE compromised_account.email = ?
  GROUP BY breach_types.type_name, breaches.name, breaches.date, breaches.description, breach_data_sources.source_name, compromised_account.password_hash
  ORDER BY breach_count DESC;
  `;

  connection.query(query, [emailToSearch], (err, results) => {
    if (err) {
      console.error('Error executing query:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    if (results.length > 0) {
      const report = {
        message: `Your data was breached.`,
        breaches: results.map(result => ({
          breach_name: result.breach_name,
          breach_date: result.breach_date,
          breach_description: result.breach_description,
          breach_type: result.breach_type,
          breach_source: result.breach_source,
          breach_count: result.breach_count,
          password_hash: result.password_hash
        }))
      };
      res.json(report);
    } else {
      res.status(404).json({ message: 'No compromised account found for the specified email.' });
    }
  });
});



app.get('/users/subscription-plan', (req, res) => {
  const email = req.query.email; // Extract email from query parameters

  if (!email) {
      return res.status(400).json({ error: 'Email is required' });
  }

  // SQL query to fetch subscription plan details based on the user's email
  const query = `
    SELECT sp.plan_name, sp.price, sp.features, sp.duration
    FROM users u
    LEFT JOIN subscription_plans sp ON u.user_category = sp.plan_id
    WHERE u.email = ?
  `;

  connection.query(query, [email], (dbErr, results) => {
      if (dbErr) {
          console.error('Error fetching subscription data:', dbErr);
          return res.status(500).json({ error: 'Internal server error' });
      }

      if (results.length === 0) {
          return res.status(404).json({ message: 'No subscription plan found for this user' });
      }

      // Send the subscription data to the client
      res.json(results[0]); // Return the first result
  });
});


// New endpoint to register or update a user with subscription plan              //CHECKED
app.post('/register-user', async (req, res) => {
  const { email, username, password, user_category, cardNumber, expiryDate, country } = req.body;

  if (!email || !username || !password || !user_category) {
    return res.status(400).json({ error: 'Email, username, password, and user category are required' });
  }

  if (user_category === 'premium' && (!cardNumber || !expiryDate || !country)) {
    return res.status(400).json({ error: 'Card details and country are required for premium users' });
  }

  try {
    // Begin the transaction
    await connection.promise().beginTransaction();

    // Insert into the `users` table
    const [userResult] = await connection.promise().query(
      `INSERT INTO users (email, username, password, user_category) VALUES (?, ?, ?, ?)`,
      [email, username, password, user_category]
    );

    const userId = userResult.insertId;

    if (user_category === 'premium') {
      // Insert into the `credit_cards` table for premium users
      await connection.promise().query(
        `INSERT INTO credit_cards (user_id, card_number, expiry_date, country) VALUES (?, ?, ?, ?)`,
        [userId, cardNumber, expiryDate, country]
      );
    }

    // Commit the transaction
    await connection.promise().commit();

    res.status(201).json({ message: 'User registered successfully' });
  } catch (error) {
    // Roll back the transaction in case of an error
    await connection.promise().rollback();
    console.error('Error during user registration transaction:', error);
    res.status(500).json({ error: 'Failed to register user' });
  }
});













app.get('/api/subscriptions/upcoming-renewals', async (req, res) => {
  const today = new Date();
  const upcomingDate = new Date(today.setDate(today.getDate() + 7)); // 7 days from now

  try {
      const subscriptions = await connection.promise().query(
          'SELECT u.user_id, s.plan_name, s.next_renewal_date FROM subscriptions s JOIN users u ON s.user_id = u.user_id WHERE s.next_renewal_date BETWEEN CURDATE() AND ?',
          [upcomingDate]
      );

      res.json(subscriptions[0]);
  } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Server error' });
  }
});

// Cron job to send renewal reminders every day at 9 AM
cron.schedule('0 9 * * *', async () => {
  try {
      const today = new Date();
      const upcomingDate = new Date(today.setDate(today.getDate() + 7)); // 7 days from now

      const subscriptions = await connection.promise().query(
          'SELECT u.email, s.plan_name, s.next_renewal_date FROM subscriptions s JOIN users u ON s.user_id = u.id WHERE s.next_renewal_date BETWEEN CURDATE() AND ?',
          [upcomingDate]
      );

      subscriptions[0].forEach((sub) => {
          sendRenewalEmail(sub.email, sub.plan_name, sub.next_renewal_date);
      });

      console.log('Renewal reminders sent!');
  } catch (err) {
      console.error('Error sending renewal reminders:', err);
  }
});

// Email function to send the renewal reminder email
function sendRenewalEmail(email, planName, renewalDate) {
  const transporter = nodemailer.createTransport({
      service: 'Gmail',
      auth: { user: 'hadikhan.a21@gmail.com', pass: '03002109173shoop' },
  });

  const mailOptions = {
      from: 'hadikhan.a21@gmail.com',
      to: email,
      subject: 'Subscription Renewal Reminder',
      text: `Hello, your subscription for ${planName} is due on ${renewalDate}. Please renew it to avoid interruption.`,
  };

  transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
          console.error('Error sending email:', error);
      } else {
          console.log('Email sent:', info.response);
      }
  });
}

// Endpoint to manually renew a subscription
app.post('/api/subscriptions/renew', async (req, res) => {
  const { subscriptionId } = req.body;

  try {
      await connection.promise().query(
          'UPDATE subscriptions SET next_renewal_date = DATE_ADD(next_renewal_date, INTERVAL 1 MONTH) WHERE id = ?',
          [subscriptionId]
      );

      res.json({ message: 'Subscription renewed successfully' });
  } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Server error' });
  }
});


// Start the server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
