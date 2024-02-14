# spec/controllers/employees_controller_spec.rb
require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  let(:user) { create(:user) }
  describe 'GET #index' do
    context 'when user is logged in' do
      before { session[:user_id] = user.id }
      it 'assigns @employees' do
        # Create an employee associated with the logged-in user
        employee = create(:employee, user: user)
        get :index
        expect(assigns(:employees)).to eq([employee]) # Make sure the employee is in the result
      end
      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end
    context 'when user is not logged in' do
      it 'redirects to login_path' do
        get :index
        expect(response).to redirect_to(login_path)
        expect(flash[:success]).to be_present
      end
    end
  end

  describe 'GET #new' do
    context 'when user is logged in' do
      before do
        allow(controller).to receive(:current_user).and_return(create(:user)) 
      end

      it 'assigns a new employee to @employee' do
        get :new
        expect(assigns(:employee)).to be_a_new(Employee)
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    # context 'when user is not logged in' do
    #   before do
    #     allow(controller).to receive(:current_user).and_return(nil)
    #   end

    #   it 'redirects to login_path' do
    #     get :new
    #     expect(response).to redirect_to(login_path)
    #   end

    #   it 'sets flash[:notice] message' do
    #     get :new
    #     expect(flash[:notice]).to eq('Must be login')
    #   end
    # end
  end
end

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