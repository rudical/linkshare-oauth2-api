module Linkshare
  class Request
  	def self.get (url, params = nil)
  		Linkshare.token.get(url, params)
  	end

  	def self.post (url, params = nil)
  		Linkshare.token.post(url)
  	end

  end
end
