class Startup < ActiveRecord::Base
  attr_accessible :ad_banner, :location_img, :name, :pitch, :screenshot, :url, :photo, :ad

  has_many :views
  
  has_attached_file :photo,
  :styles => {
    :thumb=> "100x100#",
    :small  => "150x150>" }
    
  has_attached_file :ad,
  :styles => {
    :thumb=> "100x100#",
    :small  => "150x150>" }


  # retorna
  def get_script
  	return "<iframe style='width:260px;height:70px' frameborder='0' " <<
  	" src='http://0.0.0.0:3000/show_ad?startup=#{id}'></iframe>"
  end

  def get_share_link(sponsor)
  	url = "http://0.0.0.0:3000/promote?sponsor=#{sponsor}&startup=#{self.id}"
  	#shot_url = Googl.shorten(url)
  	#return shot_url.short_url
  	return url
  end

  def get_frecuency_hash
  	frequencies = {}

		views.each do |view|

			sponsor_id = view.sponsor_id
			if frequencies[sponsor_id] == nil
				frequencies[sponsor_id] = 1
			else
				frequencies[sponsor_id] += 1
			end

		end
		return frequencies
  end

end
