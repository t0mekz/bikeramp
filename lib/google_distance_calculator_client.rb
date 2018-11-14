require "httparty"

class GoogleDistanceCalculatorClient
  include HTTParty

  DISTANCE_PATCH = "/maps/api/distancematrix/"

  base_uri 'https://maps.googleapis.com'
  
  def initialize
    @options = { query: { key: Rails.application.credentials.dig(:google_apis, :maps) } }
  end

  def calculate_distance(origin, destination, format = "json")
    @options[:query][:origins] = origin
    @options[:query][:destinations] = destination

    response = self.class.get("#{DISTANCE_PATCH}#{format}", @options)
    parse_result(response)
  end

  private

  def parse_result(response)
    if response.parsed_response["status"].eql? "OK"
      distance = response.parsed_response.dig "rows", 0, "elements", 0, "distance", "value"
      return distance / 100
    else
      raise GoogleDistanceCalculatorError.new(response.parsed_response["status"])
    end
  end
end