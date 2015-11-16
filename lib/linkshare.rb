require 'oauth2'
require 'base64'
require 'json'
require 'linkshare/request'
require 'linkshare/response'
require 'linkshare/strategy'
require 'linkshare/coupon'
require 'linkshare/link_locator'
require 'linkshare/advanced_reports'
require 'linkshare/product_search'
require 'linkshare/events'
require 'linkshare/advertiser_search'
module Linkshare
  API_URIS = {
    coupon: "https://api.rakutenmarketing.com/coupon/1.0",
    link_locator: "https://api.rakutenmarketing.com/linklocator/1.0",
    advanced_reports: "https://api.rakutenmarketing.com/advancedreports/1.0",
    product_search: "https://api.rakutenmarketing.com/productsearch/1.0",
    events: "https://api.rakutenmarketing.com/events/1.0/transactions",
    advertiser_search: "https://api.rakutenmarketing.com/advertisersearch/1.0"
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

  def self.linklocator
    @linklocator ||= Linkshare::LinkLocator.new
  end

  def self.productsearch
    @productsearch ||= Linkshare::ProductSearch.new
  end

  def self.advancedreports
    @advancedreports ||= Linkshare::AdvancedReports.new
  end

  def self.advertisersearch
    @advertisersearch ||= Linkshare::AdvertiserSearch.new
  end

  def self.events
    @events ||= Linkshare::Events.new
  end

  protected
   
  def self.client
    @client ||=  OAuth2::Client.new(Linkshare.consumer_key, Linkshare.consumer_secret, :site => SITE, :token_url => TOKEN_URL)
  end
end
