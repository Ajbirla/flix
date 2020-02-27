require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'GET index'
    it 'should return 200 status assigns @users' do
      puts 'i am tester'
      # user = User.all
      get :index
      expect(assigns(@users)).not_to be_nil
      puts assigns(@users)
      expect(response.status).to eq(200)
    end
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
end
