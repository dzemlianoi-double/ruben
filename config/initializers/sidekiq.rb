require 'sidekiq/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  sidekiq_user = Rails.application.credentials.sidekiq[:user]
  sidekiq_password = Rails.application.credentials.sidekiq[:password]
  name_params = [::Digest::SHA256.hexdigest(user), ::Digest::SHA256.hexdigest(sidekiq_user)]
  password_params = [::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(sidekiq_password)]

  Rack::Utils.secure_compare(*name_params) & Rack::Utils.secure_compare(*password_params)
end

Sidekiq.configure_client do |config|
  config.redis = { url: "#{Rails.application.credentials[:redis_url]}/0" }
end

Sidekiq.configure_server do |config|
  config.redis = { url: "#{Rails.application.credentials[:redis_url]}/0" }
end
