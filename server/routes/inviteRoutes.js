const router = require("express").Router();
const controller = require("../controllers/inviteController");
const authMiddleware = require("../middleware/authMiddleware");
const userSchemas = require('../schemas/userSchemas');
const validationMiddleware = require('../middleware/validationMiddleware');

router.post(
    "/send-invites",
    authMiddleware.stripToken,
    authMiddleware.verifyToken,
    //   validationMiddleware.validateRequest(userSchemas.registerSchema),
    controller.SendInvites
);

router.get(
    "/fetch-user-pending-invites",
    authMiddleware.stripToken,
    authMiddleware.verifyToken,
    controller.FetchUserPendingInvites
);

router.patch(
    "/update-user-invitee-status/:inviteId",
    authMiddleware.stripToken,
    authMiddleware.verifyToken,
    controller.UpdateUserInviteeStatus
);

router.get(
    "/fetch-user-accepted-invitees",
    authMiddleware.stripToken,
    authMiddleware.verifyToken,
    controller.FetchUserAcceptedInvitees
);

module.exports = router;
