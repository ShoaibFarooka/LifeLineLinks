const express = require('express');
const UserRoutes = require('./userRoutes');
const inviteRoutes = require('./inviteRoutes');

const router = express.Router();

// Set up routes
router.use('/user', UserRoutes);
router.use('/invite', inviteRoutes);

module.exports = router;