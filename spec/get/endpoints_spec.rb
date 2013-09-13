require_relative 'get_helper'

describe Nagira do 
  
  set :environment, :test       # This should run only in test mode as it uses hardcoded host names
  include Rack::Test::Methods
  def app 
    @app ||= Nagira
  end
  
  context "API endpoints" do
    
    context :top do 
      it_should_behave_like :respond_to_valid_url,  '', IMPLEMENTED[:top]
      it_should_behave_like :fail_on_random_url,    ''
    end
  end
end      
