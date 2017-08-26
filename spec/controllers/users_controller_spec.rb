require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it 'renders the new template' do
      get :new, {}
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context 'with invalid params' do
      it 'validates the presence of user\'s email and password' do
        post :create, params: {user: {name: 'adrian'} }

        expect(response).to redirect_to(new_user_url)
      end

      it 'validates that password is at least six characters long' do
        post :create, params: {user: {name: 'adrian'} }

        expect(flash[:errors]).to be_present
      end
    end

    context 'with valid params' do
      it 'redirects user to show index on success' do
        post :create, params: {user: {email: 'adrian', password:'1234567'} }

        expect(response).to redirect_to(user_url(User.last.id))
      end 
    end

  end
end
