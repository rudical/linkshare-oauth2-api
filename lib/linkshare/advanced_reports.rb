module Linkshare
  class AdvancedReports
    def initilize()
      @reportsCSV = ''
      @reportsRows = []
      @cols = []
    end
    def getCSV
      @reportsCSV
    end

    def getReports
      @reportsRows
    end

  	def fetchReports(reportid, bdate, edate, nid = '', mid = '')
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
      @reportsRows = []
  		@reportsCSV = Linkshare::Request.get(Linkshare::API_URIS[:advanced_reports], :params => params).body
      reportsrows = @reportsCSV.split(/\n/)
      @cols = reportsrows[0].split(/,/)
      reportsrows.shift
      reportsrows.each { |row|
        r = {}
        row.split(/,/).each_with_index { | o, i|
          r[@cols[i]]=o
        }
        @reportsRows.push(r)
      }
      @reportsRows
  	end
  end
end
