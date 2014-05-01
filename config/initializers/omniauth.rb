Rails.application.config.middleware.use OmniAuth::Builder do

	provider :twitter, Rails.application.secrets.twitter_key, 
										 Rails.application.secrets.twitter_secret

  provider :google_oauth2, Rails.application.secrets.google_client_id,
                     Rails.application.secrets.google_client_secret,
                     {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end

  puts "********** Google OAuth Info: #{Rails.application.secrets.google_client_id} and #{Rails.application.secrets.google_client_secret}"

end
