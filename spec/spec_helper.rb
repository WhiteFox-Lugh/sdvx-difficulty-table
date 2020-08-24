config.middleware.use RackSessionAccess::Middleware

RSpec.configure do |config|
# 省略
  require 'rack_session_access/capybara'
end
