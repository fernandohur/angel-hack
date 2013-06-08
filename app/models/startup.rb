class Startup < ActiveRecord::Base
  attr_accessible :ad_banner, :location_img, :name, :pitch, :screenshot, :url

  has_many :views


  # retorna
  def get_script
  	return "<iframe style='width:260px;height:70px' frameborder='0' " <<
  	" src='http://0.0.0.0:3000/show_ad?startup=#{id}'></iframe>"
  end

  def get_share_link(sponsor)
  	return "http://0.0.0.0:3000/promote?sponsor=#{sponsor}&startup=#{self.id}"
  end

end
