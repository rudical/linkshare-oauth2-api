require "open-uri"
module Linkshare
  class CustomReports
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
    def fetchReports(reportname, bdate, edate, network, tz="America%2FNew_York", date_type='transaction', include_summary="N")
      token = Linkshare.custom_report_token
      url = Linkshare::API_URIS[:custom_reports]+'/'+reportname+'/filters?start_date='+bdate+'&end_date='+edate+'&include_summary='+include_summary+'&network='+network.to_s+'&tz='+tz+'&date_type='+date_type+'&token='+token
      @reportsRows = []
      @reportsCSV = open(url).read()
      reportsrows = @reportsCSV.force_encoding("UTF-8").gsub("\"",'').split(/\n/)
      if reportsrows[1].match(/^\{code\:.*\}$/)
        raise 'Linkshare Error (custom report): ' + reportsrows[1]
      end
      @cols = reportsrows[0].split(/,/)
      reportsrows.shift
      reportsrows.each { |row|
        r = {}
        split_row = row.split(/,/)
        @cols.each_with_index { | o, i|
          r[@cols[i]]=split_row[i]
        }
        @reportsRows.push(r)
      }
      @reportsRows
  	end
  end
end
