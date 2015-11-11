class LinkshareController < ApplicationController
	def redirect_uri
		puts "-------- redirect ------"
		render :nothing => true
	end


end
