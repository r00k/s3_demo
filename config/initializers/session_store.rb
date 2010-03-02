# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_s3_demo_session',
  :secret      => '68e4e83df244431f2f143a31f569d172bdeb31592ec5bf8ab8fb535b4a4f3335e442345c86c9c0ec99732a0b12ba5703fb7e6ca2d5b9777d59a8bec45b6d2a7b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
