require 'oauth2'
require 'base64'
require 'json'
require 'linkshare/linkshare_strategy'
module Linkshare
  API_URIS = {
    coupon: "https://api.rakutenmarketing.com/coupon/1.0"
  }
  SITE = "https://api.rakutenmarketing.com/"
  TOKEN_URL = "token/"

  class << self
    attr_accessor :consumer_key, :consumer_secret, :sid, :username, :password
  end

  # def initialize
  #   @consumer_key = "LDvfRMkdy0jVskoXQs7UBd_LyeIa"
  #   @consumer_secret = "43fak5CCPakMrv5Hu0fqls3Wrwka"
  #   @sid = "3279068"
  #   @username = "rudie123"
  #   @password = "password123"
  #   @oauth_callback_url = 'http://263b4d92.ngrok.io'
  #   @redirect_url = 'http://263b4d92.ngrok.io'
  # end

#   def self.client ()
#     OAuth2::Client.new(Linkshare.consumer_key, Linkshare.consumer_secret, :site => SITE)
#   end

#   def self.authorize()
# #   	Linkshare.token_request_authorization = "Basic "+ Base64.encode64(Linkshare.consumer_key + ":" +Linkshare.consumer_secret)
# #     client = OAuth2::Client.new(Linkshare.consumer_key, Linkshare.consumer_secret, :site => SITE, :token_url => TOKEN_URL, :authorize_url => AUTHORIZE_URL )
# # # client.raise_errors = false
# # puts '------rudietudietudiweriuierwe-----------'
# # puts client
# # puts '------rudietudietudiweriuierwe-----------'
#     r = client.web_server.authorize_url :redirect_uri => redirect_uri, :scope => :sid
#     redirect_to r

#   end

#   def self.redirect_uri ()
#     uri = URI.parse(request.url)
#     uri.path = :redirect_uri
#     uri.query = nil
#     uri.to_s
#   end

  def self.token
    c = client
    s = Linkshare::LinkshareStrategy.new(c)
    token = s.get_token(Linkshare.username, Linkshare.password, Linkshare.sid);
  end

   
  protected
   
  def self.client
    @client ||=  OAuth2::Client.new(Linkshare.consumer_key, Linkshare.consumer_secret, :site => SITE, :token_url => TOKEN_URL)
  end


end
