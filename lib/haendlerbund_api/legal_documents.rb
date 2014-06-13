require 'httparty'
module HaendlerbundApi
  class LegalDocuments
    include HTTParty

    REQUEST_URL = "https://www.hb-intern.de/www/hbm/api/live_rechtstexte.htm"
    API_KEY = "1IqJF0ap6GdDNF7HKzhFyciibdml8t4v"

    def initialize(access_token)
      self.class.base_uri "#{REQUEST_URL}?APIkey=#{API_KEY}&AccessToken=#{access_token}"
    end

    def terms_and_conditions(args = {})
      options = { :mode => :default }.merge(args)
      make_request('12766C46A8A', options[:mode])
    end

    def cancellation_policy(args = {})
      options = { :mode => :default }.merge(args)
      make_request('12766C53647', options[:mode])
    end

    def payment_and_delivery_terms(args = {})
      options = { :mode => :default }.merge(args)
      make_request('12766C58F26', options[:mode])
    end

    def privacy_policy(args = {})
      options = { :mode => :default }.merge(args)
      make_request('12766C5E204', options[:mode])
    end

    def imprint(args = {})
      options = { :mode => :default }.merge(args)
      make_request('1293C20B491', options[:mode])
    end

    def battery_information(args = {})
      options = { :mode => :default }.merge(args)
      make_request('134CBB4D101', options[:mode])
    end

    def make_request(text_id, mode)
      self.class.get("&did=#{text_id}&mode=#{mode}").body
    end
  end
end
