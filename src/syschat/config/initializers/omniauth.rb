OmniAuth.config.logger = Rails.logger
 
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '655737710359.apps.googleusercontent.com', 'rcl9EjfU_kLKKEIEyEKgJ6bX', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end