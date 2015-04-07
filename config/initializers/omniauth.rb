Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '835976856438515', '77f4bbc0b651b36fb3c4c80d54638a72'
  provider :twitter, 'kJE5Awze7kbscrg45u339Gw94', 'me5PLTgkFECxNVdKmY8j40NKXehAkLoZBb69QmOPCBLe5C5xOs'
end
