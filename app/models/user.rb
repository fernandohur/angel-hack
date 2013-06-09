class User < ActiveRecord::Base
  attr_accessible :facebook_id, :name, :startup_id
end
