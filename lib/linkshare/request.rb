module Linkshare
  class Request
  	require 'uri'
  	def self.get (url, params = {})
  		url = URI.encode url
  		Linkshare.token.get(url, params)
  	end

  	def self.post (url, params = {})
  		url = URI.encode url
  		Linkshare.token.post(URI.encode url, params)
  	end

  end
end
