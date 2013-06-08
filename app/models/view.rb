class View < ActiveRecord::Base
  attr_accessible :sponsor_id, :startup_id

  belongs_to :startup



end
