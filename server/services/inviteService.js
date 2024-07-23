const Invite = require('../models/inviteModel');
const twilioService = require('../services/twilioService');

const createInvite = async (invitedBy, invitees) => {
    const newInvite = await Invite.create({
        invitedBy,
        invitees
    });
    return newInvite;
};

const sendInvites = async (invitees) => {
    const body = 'test message!';
    for (let invitee of invitees) {
        await twilioService.sendSMS(invitee.number, body);
    }
};

const fetchUserPendingInvites = async (number) => {
    const invites = await Invite.find({
        'invitees.number': number,
        'invitees.status': 'pending'
    })
        .populate({
            path: 'invitedBy',
            select: 'name number'
        });
    if (!invites || invites.length <= 0) {
        const error = new Error('Invites not found!');
        error.code = 404;
        throw error;
    }
    const formattedInvites = invites.map(invite => ({ inviteId: invite._id, invitedBy: invite.invitedBy }));

    return formattedInvites;
};

const updateUserInviteeStatus = async (invitedId, number, status) => {
    const invite = await Invite.findById(invitedId)
    if (!invite) {
        const error = new Error('Invite not found!');
        error.code = 404;
        throw error;
    }
    const invitee = invite.invitees.find(invitee => invitee.number === number);
    if (!invitee) {
        const error = new Error('Invitee not found!');
        error.code = 404;
        throw error;
    }
    invitee.status = status;
    await invite.save();
};

const fetchUserAcceptedInvitees = async (userId) => {
    const invite = await Invite.findOne({ invitedBy: userId })
    if (!invite) {
        const error = new Error('Invite not found!');
        error.code = 404;
        throw error;
    }

    const formattedInvitees = invite.toObject().invitees
        .filter(invitee => invitee.status === "accepted")
        .map(invitee => {
            const { status, ...rest } = invitee;
            return rest;
        });
    if (!formattedInvitees || formattedInvitees.length <= 0) {
        const error = new Error('Accepted Invitees not found!');
        error.code = 404;
        throw error;
    }

    return formattedInvitees;
};

module.exports = {
    createInvite,
    sendInvites,
    fetchUserPendingInvites,
    updateUserInviteeStatus,
    fetchUserAcceptedInvitees
};