require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "POST /" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = post('/sort-order', names: "Joe,Alice,Zoe,Julia,Kieran")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end

  # context "POST to /submit" do
  #   it "returns 200 OK with the right content" do
  #     # Send a POST request to /submit
  #     # with some body parameters
  #     # and returns a response object we can test.
  #     response = post("/submit", name: "Dana", some_other_param: 12)

  #     # Assert the response status code and body.
  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq("Hello Dana")
  #   end
  # end
end