const express = require('express');
const cors = require('cors');
require('dotenv').config();
const connectDB = require("./configs/db.config");
const routes = require('./routes/index');
const errorHandlerMiddleware = require('./middleware/errorHandlerMiddleware');


//Express Server Setup
const app = express();
const port = process.env.PORT || 5113;
const corsOptions = {
    origin: '*', // Allow all origins
    methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE'],
    allowedHeaders: ['Content-Type', 'Authorization'],
    credentials: true
};

//Express Middlewares
app.use(express.json());
app.use(cors(corsOptions));

// Connection URL
const DB = process.env.DB_URI;
connectDB(DB);

//Server status endpoint
app.get('/', (req, res) => {
    res.send('Server is Up!');
});

// Routes
app.use("/api", routes);
app.use(errorHandlerMiddleware);

app.listen(port, () => {
    console.log(`Node/Express Server is Up......\nPort: localhost:${port}`);
});
