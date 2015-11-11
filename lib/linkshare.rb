require 'oauth2'
require 'base64'
require 'json'
require 'linkshare/strategy'
require 'linkshare/coupon'
require 'linkshare/link_locator'
require 'linkshare/advanced_reports'
module Linkshare
  API_URIS = {
    coupon: "https://api.rakutenmarketing.com/coupon/1.0",
    link_locator: "https://api.rakutenmarketing.com/linklocator/1.0",
    advanced_reports: "https://api.rakutenmarketing.com/advancedreports/1.0"
  }
  SITE = "https://api.rakutenmarketing.com/"
  TOKEN_URL = "token/"

  class << self
    attr_accessor :consumer_key, :consumer_secret, :sid, :username, :password, :security_token
  end

  def self.token
    @token ||= Linkshare::Strategy.new(client).get_token(Linkshare.username, Linkshare.password, Linkshare.sid);
  end

  def self.coupon
    @coupon ||= Linkshare::Coupon.new
  end

  def self.linkLocator
    @linklocator ||= Linkshare::LinkLocator.new
  end

  def self.advancedreports
    @advancedreports ||= Linkshare::AdvancedReports.new
  end

  protected
   
  def self.client
    @client ||=  OAuth2::Client.new(Linkshare.consumer_key, Linkshare.consumer_secret, :site => SITE, :token_url => TOKEN_URL)
  end
end
