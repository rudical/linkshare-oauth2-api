require "open-uri"
require 'csv'
module Linkshare
  class CustomReports
    def initilize()
      @reportsCSV = ''
      @reportsRows = []
      @cols = []
    end


    def getReports
      @reportsRows
    end
    def fetchReports(reportname, bdate, edate, network, tz="America%2FNew_York", date_type='transaction', include_summary="N")
      token = Linkshare.custom_report_token
      url = Linkshare::API_URIS[:custom_reports]+'/'+reportname+'/filters?start_date='+bdate+'&end_date='+edate+'&include_summary='+include_summary+'&network='+network.to_s+'&tz='+tz+'&date_type='+date_type+'&token='+token
      @reportsRows = []

      filename = "linkshare_custom_report_#{reportname}_#{bdate}_#{edate}"

      # path = "#{Rails.root.join('tmp')}/#{filename}.csv"
      file = Tempfile.new(["#{filename}", '.csv']) 
      file.binmode
      file << open(url).read
      file.close
      # CSV.open(path, 'w', headers: :first_row, col_sep: ',', row_sep: "\n", encoding: 'utf-8') do |csv|
          CSV.open(file.path, 'r:bom|utf-8', headers: :first_row, col_sep: ',', quote_char: "\"", row_sep: "\r\n").each_with_index do |line, index| 
            @reportsRows.push(line)
          end
      # end 
      @reportsRows
  	end
  end
end
