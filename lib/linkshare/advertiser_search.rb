module Linkshare
  class AdvertiserSearch
  	def getAdvertisers(merchantname = nil)
      urlparam = ''
      if merchantname != nil
        urlparam = '?merchantname='+merchantname
      end
  		l = Linkshare::Response.parse(Linkshare::Request.get(Linkshare::API_URIS[:advertiser_search]+urlparam))
      if l['result'].has_key?('midlist')
        l['result']['midlist']['merchant']
      else 
        return {}
      end
  	end
  end
end
