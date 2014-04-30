Rails.application.config.middleware.use OmniAuth::Builder do

	provider :twitter, Rails.application.secrets.twitter_key, 
										 Rails.application.secrets.twitter_secret

  provider :google_oauth2, Rails.application.secrets.google_consumer_key,
                     Rails.application.secrets.google_consumer_secret
end
