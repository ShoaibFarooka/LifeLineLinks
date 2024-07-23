const userService = require('../services/userService');

const Register = async (req, res, next) => {
  try {
    const DTO = { ...req.body };
    const token = await userService.createUser(DTO);
    res.status(201).json({ token });
  } catch (error) {
    next(error);
  }
};

const Login = async (req, res, next) => {
  try {
    const DTO = { ...req.body };
    const token = await userService.loginUser(DTO);
    res.status(200).json({ token });
  } catch (error) {
    console.log(error);
    next(error);
  }
};

const UpdateUser = async (req, res, next) => {
  try {
    const userId = res.locals.payload.id;
    const DTO = { ...req.body };
    await userService.updateUser(userId, DTO);
    res.status(204).send('User info updated successfully');
  } catch (error) {
    next(error);
  }
};

module.exports = {
  Login,
  Register,
  UpdateUser,
};
