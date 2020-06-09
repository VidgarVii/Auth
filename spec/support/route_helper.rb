module RouteHelper
  include Rack::Test::Methods

  def app
    described_class
  end

  def response_body
    JSON.parse(last_response.body)
  end
end
