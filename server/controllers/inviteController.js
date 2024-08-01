const inviteService = require('../services/inviteService');

const SendInvites = async (req, res, next) => {
    try {
        const { invitees } = req.body;
        const invitedBy = res.locals.payload.id;
        const newInvite = await inviteService.createInvite(invitedBy, invitees);
        // await inviteService.sendInvites(invitees, newInvite);
        res.status(200).send('Invites sent successfully');
    } catch (error) {
        next(error);
    }
};

const FetchUserPendingInvites = async (req, res, next) => {
    try {
        const userNumber = res.locals.payload.number;
        const invites = await inviteService.fetchUserPendingInvites(userNumber);
        res.status(200).json({ invites });
    } catch (error) {
        next(error);
    }
};

const UpdateUserInviteeStatus = async (req, res, next) => {
    try {
        const userNumber = res.locals.payload.number;
        const { inviteId } = req.params;
        const { status } = req.body;
        await inviteService.updateUserInviteeStatus(inviteId, userNumber, status);
        res.status(200).send('Status updated successfully!');
    } catch (error) {
        next(error);
    }
};

const FetchUserAcceptedInvitees = async (req, res, next) => {
    try {
        const userId = res.locals.payload.id;
        const invitees = await inviteService.fetchUserAcceptedInvitees(userId);
        res.status(200).json({ invitees });
    } catch (error) {
        next(error);
    }
};

module.exports = {
    SendInvites,
    FetchUserPendingInvites,
    UpdateUserInviteeStatus,
    FetchUserAcceptedInvitees
};
