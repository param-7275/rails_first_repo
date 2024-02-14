require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new_signup' do
    it 'renders the new_signup template' do
      get :new_signup
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new_signup)
    end
  end


	describe 'POST #sign_up' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          user: {
            username: 'test_user',
            email: 'test@example.com',
            password: 'Test@123',
            password_confirmation: 'Test@123'
          }
        }
      end

      it 'creates a new user and redirects to sign_up_path' do
        post :sign_up, params: valid_params
        expect(response).to redirect_to(sign_up_path)
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          user: {
            username: 'tesuser',
            email: 'invalid_email',
            password: 'Test@123',
            password_confirmation: 'Test@123'
          }
        }
      end

      it 'does not create a new user and redirects to sign_up_path' do
				post :sign_up, params: invalid_params
				expect(response).to redirect_to(sign_up_path)
				expect(flash[:error]).to be_present
			end
    end
  end

	describe 'GET #new_login' do
    it 'renders the new_login template' do
      get :new_login
      expect(response).to render_template(:new_login)
    end
  end

	describe 'POST #login' do
    context 'with valid credentials' do
      let(:user) { FactoryBot.create(:user, username: 'test_user', password: 'Test@123') }

      it 'logs in the user and redirects to login_path' do
        post :login, params: { user: { username: user.username, password: 'Test@123' } }
        expect(response).to redirect_to(show_all_employee_path)
        expect(flash[:success]).to be_present
        expect(session[:user_id]).to eq(user.id)
      end
    end

    context 'with invalid credentials' do
      let(:invalid_credentials) do
        {
          user: {
            username: 'test_user',
            password: 'wrong_password'
          }
        }
      end

      it 'does not log in the user and redirects to login_path' do
        post :login, params: invalid_credentials
        expect(response).to redirect_to(login_path)
        expect(flash[:error]).to be_present
        expect(session[:user_id]).to be_nil
      end
    end
  end

	describe 'DELETE #destroy' do
    it 'clears the session and redirects to login_path' do
      session[:user_id] = "f"
      delete :destroy, params: { id:  session[:user_id]  }
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(login_path)
    end
  end

end
