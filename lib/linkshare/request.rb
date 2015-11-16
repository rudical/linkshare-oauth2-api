module Linkshare
  class Request
  	require 'uri'
  	def self.get (url, params = {})
  		url = URI.encode url
      unless(params.has_key?(:header) && params[:header].has_key?("Access"))
        params.merge(:header=>{'Accept' => 'application/xml'})
      end
  		Linkshare.token.get(url, params)
  	end
  end
end
