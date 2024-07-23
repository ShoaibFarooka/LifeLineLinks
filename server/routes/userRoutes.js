const router = require("express").Router();
const controller = require("../controllers/userController");
const authMiddleware = require("../middleware/authMiddleware");
const userSchemas = require('../schemas/userSchemas');
const validationMiddleware = require('../middleware/validationMiddleware');

router.post(
  "/register",
  validationMiddleware.validateRequest(userSchemas.registerSchema),
  controller.Register
);
router.post(
  "/login",
  validationMiddleware.validateRequest(userSchemas.loginSchema),
  controller.Login
);
router.put(
  "/update-user-info",
  authMiddleware.stripToken,
  authMiddleware.verifyToken,
  validationMiddleware.validateRequest(userSchemas.updateUserInfoSchema),
  controller.UpdateUser
);

module.exports = router;
