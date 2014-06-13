require 'spec_helper'

describe HaendlerbundApi::LegalDocuments do
  request_url = 'https://www.hb-intern.de/www/hbm/api/live_rechtstexte.htm'
  api_key = '1IqJF0ap6GdDNF7HKzhFyciibdml8t4v'
  access_token = 'xyzxyz'
  document_types = {
    '12766C46A8A' => 'terms_and_conditions',
    '12766C53647' => 'cancellation_policy',
    '12766C58F26' => 'payment_and_delivery_terms',
    '12766C5E204' => 'privacy_policy',
    '1293C20B491' => 'imprint',
    '134CBB4D101' => 'battery_information'
  }

  document_modes = %w(default classes plain classes_head)

  before :each do
    document_types.each do |text_id, document_name|
      document_modes.each do |mode|
        stub_request(:get, "#{request_url}?APIkey=#{api_key}&AccessToken=#{access_token}&did=#{text_id}&mode=#{mode}").to_return(:body => "#{document_name} #{mode}");
      end
    end
    @haendlerbund_api_client = HaendlerbundApi::LegalDocuments.new(access_token)
  end

  subject { @haendlerbund_api_client }

  document_types.each do |text_id, document_name|
    context document_name do
      it 'should be available' do
        subject.should respond_to document_name
      end
      it 'should return HTML in default styling when called without mode parameter' do
        subject.send(document_name).should == "#{document_name} default"
      end
      document_modes.each do |mode|
        it "should return content in #{mode} mode" do
          subject.send(document_name, :mode => mode).should == "#{document_name} #{mode}"
        end
      end
    end
  end

end
