require 'mailgun'

# First, instantiate the Mailgun Client with your API key
mg_client = Mailgun::Client.new '3af2dd5f80464277e6a2ceee854ff8e2-b892f62e-efbc8bd1'

# Define your message parameters
message_params =  { from: 'bob@adrenabid.com',
                    to:   'abellocati@hotmail.com',
                    subject: 'The Ruby SDK is awesome!',
                    text:    'It is really easy to send a message!'
                  }

# Send your message through the client
mg_client.send_message 'adrenabid.com', message_params
