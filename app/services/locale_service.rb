# frozen_string_literal: true

require 'geocoder'

class LocaleService
  attr_reader :request

  EUROPE_COUNTRIES        = -> { fetch_countries('Europe') }
  SOUTH_AMERICA_COUNTRIES = -> { fetch_countries('South America') }
  NORTH_AMERICA_COUNTRIES = -> { fetch_countries('North America') }

  # Constructor
  def initialize(request)
    @request = request
  end

  # Call the service
  def self.call(request)
    new(request).send(:determine_locale)
  end

  private

  # Determine the final idiom locale
  def determine_locale
    user_ip = @request.remote_ip
    user_location = Geocoder.search(user_ip).first

    if user_location
      country_code = user_location.country_code
      region = find_region_for_country_code(country_code)

      case region
      when :europe then :pl
      when :south_america then :pt
      when :north_america then :en
      else
        I18n.default_locale
      end
    else
      I18n.default_locale
    end
  end

  # Check if a country is present in a given region
  def country_in_region?(country_code, region_countries)
    region_countries.include?(country_code)
  end

  # Find region for a given country code
  def find_region_for_country_code(country_code)
    return :europe if country_in_region?(country_code, EUROPE_COUNTRIES.call)
    return :south_america if country_in_region?(country_code, SOUTH_AMERICA_COUNTRIES.call)
    return :north_america if country_in_region?(country_code, NORTH_AMERICA_COUNTRIES.call)
  end

  # Fetch and cache countries for a given region
  def self.fetch_countries(region)
    Rails.cache.fetch("#{region}_countries", expires_in: 12.hours) do
      Country.where(region: region).pluck(:country_code)
    end
  end
end