Rails.application.config.middleware.use OmniAuth::Builder do
  # configure do |config|
  #   # config.path_prefix = '/welcomes/auth'
  #   config.path_prefix = '/super_users/auth'
  # end
  # provider :developer unless Rails.env.production?
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :google_oauth2,  '531128403534-fneq2es1ru024ibkn5c0121vkggcq9ia.apps.googleusercontent.com', 'fRPwvdZNhaNF4BrrzixBcnpW'
end