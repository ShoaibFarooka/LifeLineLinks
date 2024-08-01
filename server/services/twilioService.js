const twilio = require("twilio");

const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const senderNumber = process.env.TWILIO_SENDER_NUMBER;

const options = {
    autoRetry: true,
    maxRetries: 3,
};
const client = twilio(accountSid, authToken, options);

const sendSMS = async (to, body) => {
    try {
        const message = await client.messages.create({
            body,
            from: senderNumber,
            to
        });
        console.log(`Message sent to ${to}: ${message.sid}`);
        return message;
    } catch (error) {
        console.error(`Error sending message to ${to}:`, error);
        throw error; // Propagate the error to handle it in the caller function
    }
};

const test = async () => {
    const body = 'testing twilio23...';
    const number = '+16176920988';
await sendSMS(number, body);
};

// test();

module.exports = {
    sendSMS
};
