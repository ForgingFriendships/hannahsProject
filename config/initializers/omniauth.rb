Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '835976856438515', '77f4bbc0b651b36fb3c4c80d54638a72'
  provider :twitter, 'kJE5Awze7kbscrg45u339Gw94', 'me5PLTgkFECxNVdKmY8j40NKXehAkLoZBb69QmOPCBLe5C5xOs'
  provider :google_oauth2, '559258992679-vvt7dbitdkkhhl79he9hkqklpemc3gpf.apps.googleusercontent.com',
  '24uCH0aZKDIBm4CzESjoPib6'
end
