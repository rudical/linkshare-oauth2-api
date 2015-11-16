require "recursive_open_struct"

module Linkshare
  class Response
    def self.parse(raw_data)
      Hash.from_xml(raw_data.body.gsub("\n", ""))      
    end
    def self.parse2(raw_data)
      data = []
      data = [RecursiveOpenStruct.new(raw_data)] if raw_data.is_a?(Hash) # If we got exactly one result, put it in an array.
      raw_data.each { |i| data << RecursiveOpenStruct.new(i) } if raw_data.is_a?(Array)
      data
    end
  end
end
