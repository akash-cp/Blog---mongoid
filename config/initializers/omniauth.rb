Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :google_oauth2, '531128403534-fneq2es1ru024ibkn5c0121vkggcq9ia.apps.googleusercontent.com', 'fRPwvdZNhaNF4BrrzixBcnpW'
end