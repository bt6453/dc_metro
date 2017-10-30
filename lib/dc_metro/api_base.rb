module DcMetro
  class ApiBase

    WMATA_API_URL = "https://api.wmata.com/"
    MAX_TRIES     = 2
    RETRY_SLEEP   = 1
    TIMEOUT       = 60
    OPEN_TIMEOUT  = 10

    class << self

      private
      
      def get(path, params = {})
        response              = Retryable.retryable(retryable_options(params)) do
          connection.get do |req|
            req.path                   = path
            req.options[:timeout]      = TIMEOUT
            req.options[:open_timeout] = OPEN_TIMEOUT
            req.params                 = camel_params(params)
          end
        end
        # TODO Make a Response model instead
        OpenStruct.new(response.body)
      end

      def connection
        Faraday.new(url: WMATA_API_URL) do |faraday|
          faraday.headers["api_key"] = ENV["API_KEY"]
          faraday.use FaradayMiddleware::ParseJson
          faraday.adapter Faraday.default_adapter
        end
      end

      def camel_params(params)
        {}.tap do |camelized_params|
          params.each do |key, value|
            camelized_params[key.to_s.camelize] = value
          end
        end
      end

      def retryable_options(options)
        {
          tries: MAX_TRIES,
          sleep: RETRY_SLEEP
        }
      end
    end
  end
end
