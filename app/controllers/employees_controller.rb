class EmployeesController < ApplicationController

  before_action :current_user

   
  def index
    @employees = Employee.where(user_id: session[:user_id])
  end

  def new
    @employee = Employee.new
  end

  def create
    # binding.irb
    @employee = Employee.new(employee_params.merge(user_id: @user.id))
    # employee_params_hash = employee_params.to_h
    # @employee = Employee.new(employee_params_hash.merge(user_id: @user.id))
    if @employee.save
      # @employee.avatar.attach(params[:avatar])
      flash[:success] = "Employee successfully created!"
      redirect_to show_all_employee_path
    else
      flash[:error] = @employee.errors.full_messages
      redirect_to new_employee_path
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update    
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:success] = "Employee updated successfully!"
      redirect_to show_all_employee_path
    else
      render :edit
    end
  end
  
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    flash[:success] = "Employee Deleted successfully!"
    redirect_to show_all_employee_path
  end

  def delete_employees
    @employee = Employee.with_deleted.where.not(deleted_at: nil).where(user_id: session[:user_id])
  end

  def restore_employee
    # binding.irb
    @employee = Employee.with_deleted.find(params[:id])
    @employee.update(deleted_at: nil)
    redirect_to delete_employee_path
  end

  private
  def employee_params
    params.require(:employee).permit(:employee_first_name, :employee_last_name, :employee_age, :employee_salary, 
    :employee_joining_date, :employee_contact, :employee_email, :user_id)
  end

  def current_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to login_path
      flash[:success] = "Must be login"
    end
  end
end