require 'spec_helper'
require 'jwt'

Rspec.describe Api::V1::UsersController, :type => :api do

	context 'user is unauthorized'
  
  before do 
  	token = JWT.encode({User.first.id}, ENV["AUTH_SECRET"], "HS256")
  	 header "Authorization", "Bearer #{token}"
  	 get url
  end

  describe "actions" do

  	 describe "#show" do

  	 	before do
  	 		  get 'users/1'
  		    json = JSON.parse(last_response.body)
     end

  		  it "returns user's profile with http success" do
        expect(json["data"]["id"]).to_eq(1)
        expect(last_response).to have_http_status(:success)
      end

      it "JSON body hash has all required user's attributes" do
      	 expect(hash_body.keys).to match_array([:id, :name, :password, :working_status, :salary])
      end

    end

    describe "GET#index" do

    	 before do
    	 	 get :index
    	 end

    	 it "should return list of users" do
    	 	 it "returns http success" do
    	 	 	 expect(last_response).to have_http_status(:success)
        end
      end

    end

  end

  context 'there is no user with id'

  	 it 'responds with a message of unprocessable entity' do
  	 	 message = json["errors"].first["detail"]
  	 	 expect(message).to eq("unprocessable entity")
    end

end