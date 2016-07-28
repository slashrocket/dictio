Clearance.configure do |config|
  config.allow_sign_up = true # Clearance Default
  config.cookie_domain = ".dictio.io"
  config.cookie_expiration = lambda { |cookies| 1.year.from_now.utc } # Clearance Default
  config.cookie_name = "remember_token" # Clearance Default
  config.cookie_path = "/" # Clearance Default
  config.routes = true
  config.httponly = false # Clearance Default
  config.mailer_sender = "reply@example.com" # Clearance Default
  config.password_strategy = Clearance::PasswordStrategies::BCrypt # Clearance Default
  config.redirect_url = "/" # Clearance Default
  config.secure_cookie = false # Clearance Default
  config.sign_in_guards = [] # Clearance Default
  config.user_model = User # Clearance Default
end
