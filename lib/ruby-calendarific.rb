require 'addressable/uri'
require 'json'
require 'net/http'
require 'openssl'

module Calendarific
  class V2
    def initialize(api_key = false)
      @api_key = api_key
    end

    def holidays(params = Hash.new)
      if !params.has_key?('api_key')
        params['api_key'] = @api_key
      end

      uri = Addressable::URI.new
      uri.query_values = params

      uri = URI("https://calendarific.com/api/v2/holidays?#{uri.query}")

      Net::HTTP.start(
        uri.host,
        uri.port,
        :use_ssl => true,
        :verify_mode => OpenSSL::SSL::VERIFY_NONE
      ) do |http|
        request = Net::HTTP::Get.new uri

        response = http.request request
        return JSON.parse(response.body)
      end
    end
  end
end

