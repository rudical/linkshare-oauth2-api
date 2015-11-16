module Linkshare
  class ProductSearch
    def initialize
      @keywords = []
      @sorts = []
      @mid = nil
      @cat = nil
      @max = "20"
      @pagenumber = "1"
    end
    def addKeyword(keyword, type = "keyword")
      @keywords.push({keyword: keyword, type: type})
    end
    def clearKeywords
      @keywords = []
    end
    def addSort(sort, type = "desc")
      @sorts.push({sort: sort, type: type})
    end
    def clearSorts
      @sorts = []
    end
    def setCat(cat)
      @cat = cat
    end
    def setMaxResults(maxResults = 20)
      @max = maxResults.to_s
    end
    def setPageNumber(pagenumber = 1)
      @pagenumber = pagenumber.to_s
    end    
    def setMid(mid)
      @mid = mid.to_s
    end

  	def getProducts()
      params = '?'
      @keywords.each_with_index {|k, i| 
        if i != 0 
          params += "&"
        end
        params += k[:type]+"="+k[:keyword]
      }
      @sorts.each {|s| params += "&sort="+s[:sort]+"&sorttype="+s[:type]}
      if @cat != nil
        params += '&cat='+@cat
      end      
      if @mid != nil
        params += '&mid='+@mid
      end
      params += '&max='+@max
      params += '&pagenumber='+@pagenumber
      Linkshare::Response.parse(Linkshare::Request.get(Linkshare::API_URIS[:product_search]+params))
  		# ap Linkshare::Request.get('https://api.rakutenmarketing.com/productsearch/1.0?keyword=toy&max=20&pagenumber=1')
  	end
  end
end
