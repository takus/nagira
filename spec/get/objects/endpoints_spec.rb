require_relative '../get_helper'

describe Nagira do 
  
  set :environment, :test       # This should run only in test mode as it uses hardcoded host names
  include Rack::Test::Methods
  def app 
    @app ||= Nagira
  end
  
  context "API endpoints" do
    context "/_objects" do
      it_should_behave_like :respond_to_valid_url,  "/_objects"
      it_should_behave_like :respond_to_valid_url,  "/_objects/_list"


      it_should_behave_like :respond_to_valid_url,  "/_objects", IMPLEMENTED[:objects]
      it_should_behave_like :fail_on_random_url,    "/_objects"
      # AR- compatibility
      it_should_behave_like :respond_to_valid_url,  "/_objects", IMPLEMENTED[:objects].map(&:pluralize)
      
      context :host do 
        host   = IMPLEMENTED[:hosts].first 
        spaces = "host%20with%20space"

        it_should_behave_like :respond_to_valid_url,  "/_objects/host/#{host}"
        it_should_behave_like :fail_on_bad_url,       "/_objects/host/#{spaces}"
        it_should_behave_like :respond_to_valid_url,  "/_objects/host/#{host}/_list"
        
      end
    end
  end                           # API endpoints
end                             # describe Nagira
