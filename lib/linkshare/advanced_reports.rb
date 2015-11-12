module Linkshare
  class AdvancedReports
  	def getReports(reportid, bdate, edate, nid = '', mid = '')
      token = Linkshare.security_token
      params = {
        'token' => token,
        'reportid' => reportid,
        'bdate' => bdate, 
        'edate' => edate 
      }
      unless nid == ''
        params.merge({ 'nid' => nid})
      end      
      unless mid == ''
        params.merge({ 'mid' => mid})
      end
  		Linkshare::Request.get(Linkshare::API_URIS[:advanced_reports], :params => params)
  	end
  end
end
