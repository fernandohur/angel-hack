class ShortenerController < ApplicationController

	def shorten
		url = params[:url]
		googl_url = Googl.shorten(url)
  	short_url = googl_url.short_url

  	render :text=>short_url

	end



end
