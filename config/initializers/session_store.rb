# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dummyapp_session',
  :secret      => '0d2ec64f9791ddd59af8a0bf8265f7b0321e799078c69e4d9a1a046d4e37e3a4bb01c52e8518937e566ef5a1e42d4eaf7b41b52a54c2cd27dd4cc1c02abf4790'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
