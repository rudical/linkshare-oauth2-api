module Linkshare
  class LinkLocator
  	def getMerchByID(mid)
  		Linkshare.token.get(Linkshare::API_URIS[:link_locator]+'/getMerchByID/'+mid.to_s)
  	end

  	def getMerchByID(name)
  		Linkshare.token.get(Linkshare::API_URIS[:link_locator]+'/getMerchByName/'+name)
  	end

  	def getMerchByCategory(cat)
  		Linkshare.token.get(Linkshare::API_URIS[:link_locator]+'/getMerchByCategory/'+cat.to_s)
  	end

  	def getMerchByAppStatus(statusID)
  		Linkshare.token.get(Linkshare::API_URIS[:link_locator]+'/getMerchByAppStatus/'+statusID.to_s)
  	end

  	def getProductLinks(mid, creativeCategory = '0', page = '1')
  		Linkshare.token.get(Linkshare::API_URIS[:link_locator]+'/getProductLinks/'+mid.to_s+'/'+creativeCategory.to_s+'/-1/'+page.to_s)
  	end

  	def getDRMLinks(mid, creativeCategory = '0', startDate = '', endDate = '', page = '1')
  		Linkshare.token.get(Linkshare::API_URIS[:link_locator]+'/getDRMLinks/'+mid.to_s+'/'+creativeCategory.to_s+'/'+startDate+'/'+endDate+'/'+page.to_s)
  	end

  	def getBannerLinks(mid, creativeCategory = '0', startDate = '', endDate = '', size = -'1', page = '1')
  		Linkshare.token.get(Linkshare::API_URIS[:link_locator]+'/getBannerLinks/'+mid.to_s+'/'+creativeCategory.to_s+'/'+startDate+'/'+endDate+'/'+size.to_s+'/-1/'+page.to_s)
  	end

  	def getTextLinks(mid, creativeCategory = '0', startDate = '', endDate = '', page = '1')
  		Linkshare.token.get(Linkshare::API_URIS[:link_locator]+'/getTextLinks/'+mid.to_s+'/'+creativeCategory.to_s+'/'+startDate+'/'+endDate+'/-1/'+page.to_s)
  	end
  end
end
