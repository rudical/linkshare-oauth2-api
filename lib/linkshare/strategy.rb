require 'oauth2'
require 'base64'
module Linkshare
  class Strategy < OAuth2::Strategy::Base
    # Retrieve an access token given the specified End User username, password and Linkshare AccountID.
    #
    # @param [String] username the End User username
    # @param [String] password the End User password
    # @param [String] sid the Account ID
    # @param [Hash] params additional params
    def get_token(username, password, sid, params = {}, opts = {})
      request_body = opts.delete('auth_scheme') == 'request_body'
      params = {'grant_type' => 'password',
                'username'   => username,
                'password'   => password,
                'scope' => sid
              }.merge(client_params).merge(params)

      params.merge!('client_params' => {
        :headers => {
          'Authorization' => authorization(client_params['client_id'], client_params['client_secret']),
          'Accept' => 'application/xml'}
        })

      # params.merge(:parse => :xml)
      @client.get_token(params, opts)
    end


    # Returns the Authorization header value for Basic Authentication
    #
    # @param [String] The client ID
    # @param [String] the client secret
    def authorization(client_id, client_secret)
      'Basic ' + Base64.encode64(client_id + ':' + client_secret).gsub("\n", '')
    end
  end
end
