def lambda_handler(event:, context:)
  provided_signature = event['headers']['x-request-signature'].split('=').last
  generated_signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['WEBHOOK_SECRET'], event['body'])

  # needs a constant-time comparison method to prevent timing attacks
  if provided_signature != generated_signature
    raise "signature mismatch :("


