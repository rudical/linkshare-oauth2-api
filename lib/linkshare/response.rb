module Linkshare
  class Response
    def self.parse(raw_data)
      Hash.from_xml(raw_data.body.gsub("\n", ""))      
    end    
    def self.json_parse(raw_data)
      JSON.parse(raw_data.body)
    end
  end
end
