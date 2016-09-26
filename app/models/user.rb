class User < ActiveRecord::Base
  require_secure_password
end
