require_relative '../get_helper'

describe Nagira do 
  
  set :environment, :test       # This should run only in test mode as it uses hardcoded host names
  include Rack::Test::Methods
  def app 
    @app ||= Nagira
  end
  
  subject {  JSON.parse last_response.body }

  context "Data structure" do
    context "/_objects" do

      let (:host) {  IMPLEMENTED[:hosts].first }

      it { get "/_objects" ; should be_a_kind_of Hash }
      it { get "/_objects/_list" ; should be_a_kind_of Array }
      it { get "/_objects/host" ; should be_a_kind_of Hash }
      it { get "/_objects/host/#{host}" ; should be_a_kind_of Hash }
      
    end
  end                           # Data structure
end                             # describe Nagira
