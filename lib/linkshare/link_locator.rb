module Linkshare
  class LinkLocator
    STATUS = {
      :approved => "approved",
      :wait => "wait",
      :approval_extended => "approval extended", 
      :temp_removed => "temp removed", 
      :temp_rejected => "temp rejected", 
      :perm_removed => "perm removed", 
      :perm_rejected => "perm rejected", 
      :self_removed => "self removed"
    }
  	def getMerchByID(mid)
  		l = Linkshare::Response.parse(Linkshare::Request.get(Linkshare::API_URIS[:link_locator]+'/getMerchByID/'+mid.to_s))
      l['getMerchByIDResponse']['return']
  	end

  	def getMerchByName(name)
  		l = Linkshare::Response.parse(Linkshare::Request.get(Linkshare::API_URIS[:link_locator]+'/getMerchByName/'+name))
      l['getMerchByNameResponse']['return']
  	end

  	def getMerchByCategory(cat)
  		l = Linkshare::Response.parse(Linkshare::Request.get(Linkshare::API_URIS[:link_locator]+'/getMerchByCategory/'+cat.to_s))
      l['getMerchByCategoryResponse']['return']
  	end

  	def getMerchByAppStatus(statusID = STATUS[:approved])
      l = l = Linkshare::Response.parse(Linkshare::Request.get(Linkshare::API_URIS[:link_locator]+'/getMerchByAppStatus/' + STATUS[statusID]))
      l['getMerchByAppStatusResponse']['return']
  	end

  	def getProductLinks(mid, creativeCategory = '0', page = '1')
  		l = Linkshare::Response.parse(Linkshare::Request.get(Linkshare::API_URIS[:link_locator]+'/getProductLinks/'+mid.to_s+'/'+creativeCategory.to_s+'/-1/'+page.to_s))
      l['getProductLinksResponse']['return']
  	end

  	def getDRMLinks(mid, creativeCategory = '0', startDate = '', endDate = '', page = '1')
  		l = Linkshare::Response.parse(Linkshare::Request.get(Linkshare::API_URIS[:link_locator]+'/getDRMLinks/'+mid.to_s+'/'+creativeCategory.to_s+'/'+startDate+'/'+endDate+'/-1/'+page.to_s))
      l['getDRMLinksResponse']['return']
  	end

  	def getBannerLinks(mid, creativeCategory = '0', startDate = '', endDate = '', size = '-1', page = '1')
      l = Linkshare::Response.parse(Linkshare::Request.get(Linkshare::API_URIS[:link_locator]+'/getBannerLinks/'+mid.to_s+'/'+creativeCategory.to_s+'/'+startDate+'/'+endDate+'/'+size.to_s+'/-1/'+page.to_s))
      l['getBannerLinksResponse']['return']
  	end

  	def getTextLinks(mid, creativeCategory = '0', startDate = '', endDate = '', page = '1')
  		l = Linkshare::Response.parse(Linkshare::Request.get(Linkshare::API_URIS[:link_locator]+'/getTextLinks/'+mid.to_s+'/'+creativeCategory.to_s+'/'+startDate+'/'+endDate+'/-1/'+page.to_s))
      l['getTextLinksResponse']['return']
  	end


  end
end
