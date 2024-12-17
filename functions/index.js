/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.sendOfferNotification = functions.firestore
  .document('offers/{offerId}')
  .onCreate(async (snap, context) => {
    const offerData = snap.data();

    const restOwnerToken = offerData.restOwnerFCMToken; // Token for restaurant owner
    const clientToken = offerData.clientFCMToken; // Token for client

    const messages = [];

    // Build the messages for each recipient
    if (restOwnerToken) {
      messages.push({
        token: restOwnerToken,
        notification: {
          title: 'New Offer Created!',
          body: `A new offer has been added by your restaurant: ${offerData.restaurantName}.`,
        },
        data: {
          type: 'newOffer',
          offerId: context.params.offerId,
        },
      });
    }

    if (clientToken) {
      messages.push({
        token: clientToken,
        notification: {
          title: 'New Offer for You!',
          body: `Check out the new offer from ${offerData.restaurantName}.`,
        },
        data: {
          type: 'newOffer',
          offerId: context.params.offerId,
        },
      });
    }

    try {
      // Send notifications for all messages
      const responses = await Promise.all(
        messages.map((message) => admin.messaging().send(message))
      );
      console.log('Notifications sent successfully:', responses);
    } catch (error) {
      console.error('Error sending notifications:', error);
    }

    return null; // Exit the function
  });
