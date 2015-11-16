module Linkshare
  class Events
  	def getEvents(process_date_start = nil, process_date_end=nil, transaction_date_start=nil, transaction_date_end=nil, limit="1000", page="1")
  		Linkshare::Response.json_parse(Linkshare::Request.get(Linkshare::API_URIS[:events], {:headers => {'Accept' => 'text/json'}}))
  	end
  end
end
