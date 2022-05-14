const crypto = require('crypto');

exports.handler = async (event) => {

  const request_signature = event.headers ? event.headers['x-header-signature'] : "";
  const computed_signature = crypto.createHmac("sha256", process.env.SHARED_SECRET)
                                .update(Buffer.from(event.body, "base64").toString('utf8'))
                                .digest("base64");

  // TODO: is there a constant-time comparison method in the crypto lib?
  if (request_signatue !== computed_signature) {
    // auth failed!
  }
