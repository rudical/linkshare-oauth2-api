module Linkshare
  class Coupon
  	def initialize (query = {})
  		@totalMatches = 0
  		@totalPages = 0
  		@pageNumberRequested = 0
  		@coupons = []
  		@query = query
  	end
  	def getTotalMatches()
  		@totalMatches
  	end
  	
  	def getTotalPages()
  		@totalPages
  	end
  	
  	def getPageNumberRequested()
  		@pageNumberRequested
  	end
  	
  	def getCoupons()
  		@coupons
  	end
  	def query(query)
  		@query = query
  	end

  	def fetch()
  		data = Linkshare::Response.parse(Linkshare::Request.get(Linkshare::API_URIS[:coupon], :params => @query))
  		@totalMatches = data["couponfeed"]["TotalMatches"]
  		@totalPages = data["couponfeed"]["TotalPages"]
  		@pageNumberRequested = data["couponfeed"]["PageNumberRequested"]
  		@coupons = data["couponfeed"]["link"]
  	end
  end
end
