class EmployeesController < ApplicationController

    # http_basic_authenticate_with name: "dhh", password: "secret"
    before_action :set_employee, only: [:edit,:show,:update,:destroy]
    def index
        @employees = Employee.all
    end
    def create
        # @employee = Employee.new(first_name: params[:employee][:first_name])
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to employees_path , notice: 'Employee has been created successfully.'
        else
            render :new
        end
    end
    def new
        @employee = Employee.new
    end
    def edit
    end
    def show
    end
    def update
        if @employee.update(employee_params)
            redirect_to employees_path,notice: 'Employee has been updated successfully.'
        else
            render :edit
        end
    end
    def destroy
        if @employee.destroy
            redirect_to employees_path,notice: 'Employee has been deleted successfully.'
        end
    end

    private
        def employee_params
               # params.require(:employee).permit!
            params.require(:employee).permit(:first_name, :middle_name, :last_name, :email, :address, :city, :state, :pincode, :country,:dob)
        end
        
        def set_employee
            @employee = Employee.find(params[:id])
        rescue ActiveRecord::RecordNotFound => error
            redirect_to employees_path, notice: error
        end
end
