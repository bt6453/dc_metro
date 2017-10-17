require "retryable"
require "faraday"
require "faraday_middleware"
require "dc_metro/version"
require "ostruct"

module DcMetro
  autoload :RailStations, "dc_metro/rail_stations"
  autoload :Connection, "dc_metro/api_base"
end
