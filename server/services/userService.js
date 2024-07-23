const User = require('../models/userModel');
const authMiddleware = require('../middleware/authMiddleware');

const createUser = async (userData) => {
  const { name, number, email, password } = userData;
  let existingUser = await User.findOne({ email });
  if (existingUser) {
    const error = new Error('A user with that email has already been registered!');
    error.code = 400;
    throw error;
  }
  existingUser = await User.findOne({ number });
  if (existingUser) {
    const error = new Error('A user with that number has already been registered!');
    error.code = 400;
    throw error;
  }
  let passwordDigest = await authMiddleware.hashPassword(password);
  const user = await User.create({
    name,
    number,
    email,
    password: passwordDigest,
  });
  const payload = {
    id: user._id,
    email: user.email,
    number: user.number
  };
  const token = authMiddleware.createToken(payload);
  return token;
};

const loginUser = async (loginData) => {
  const { email, password } = loginData;
  const user = await User.findOne({ email });
  if (!user) {
    const error = new Error('User not found');
    error.code = 404;
    throw error;
  }
  let passwordMatched = await authMiddleware.comparePassword(user.password, password);
  if (!passwordMatched) {
    const error = new Error('Unauthorized');
    error.code = 401;
    throw error;
  }
  let payload = {
    id: user._id,
    email: user.email,
    number: user.number
  };
  let token = authMiddleware.createToken(payload);
  return token;
};

const updateUser = async (userId, updateData) => {
  const updatedUser = await User.findByIdAndUpdate(
    userId,
    updateData,
    { new: true }
  );
  if (!updatedUser) {
    const error = new Error('User not found');
    error.code = 404;
    throw error;
  }
  return updatedUser;
};

module.exports = {
  createUser,
  loginUser,
  updateUser,
};
