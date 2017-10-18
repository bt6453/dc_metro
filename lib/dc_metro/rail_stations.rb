module DcMetro
  class RailStations < ApiBase
    RAIL_STATIONS_PATH = "Rail.svc/json"
    # TODO Use a response model
    # TODO Add tests
    class << self
      def lines
        get "#{RAIL_STATIONS_PATH}/jLines"
      end

      def parking(station_code = nil)
        params = { station_code: station_code }

        get "#{RAIL_STATIONS_PATH}/jStationParking", params
      end

      def path_between_stations(from_station_code, to_station_code)
        params = {
          from_station_code: from_station_code,
          to_station_code:   to_station_code
        }

        get "#{RAIL_STATIONS_PATH}/jPath", params
      end

      def station_entrances(latitude = nil, longitude = nil, radius = nil)
        params = {
          lat:    latitude,
          lon:    longitude,
          radius: radius
        }

        get "#{RAIL_STATIONS_PATH}/jStationEntrances", params
      end

      def station_information(station_code)
        params = { station_code: station_code }

        get "#{RAIL_STATIONS_PATH}/jStationInfo", params
      end

      def station_list(line_code = nil)
        params = { line_code: line_code }
        get "#{RAIL_STATIONS_PATH}/jStations", params
      end

      def station_times(station_code = nil)
        params = { station_code: station_code }

        get "#{RAIL_STATIONS_PATH}/jStationTimes", params
      end

      def station_to_station_info(from_station_code = nil, to_station_code = nil)
        params = {
          from_station_code: from_station_code,
          to_station_code:   to_station_code
        }

        get "#{RAIL_STATIONS_PATH}/jSrcStationToDstStationInfo", params
      end
    end
  end
end
