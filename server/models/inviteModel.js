const mongoose = require("mongoose");

const inviteeSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    number: {
        type: String,
        required: true,
        trim: true
    },
    status: {
        type: String,
        default: 'pending',
        enum: ['pending', 'accepted', 'rejected']
    }
});

const inviteSchema = new mongoose.Schema(
    {
        invitedBy: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User',
            required: true,
            trim: true
        },
        invitees: [inviteeSchema]
    },
    { timestamps: true }
);

const Invite = mongoose.model("Invite", inviteSchema);

module.exports = Invite;
