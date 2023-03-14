class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        students = Student.all
        render json: students, status: :ok
    end

    def show
        student = find_student
        render json: student, status: :ok
    end

    def update
        student = find_student 
        student.update(student_params)
        render json: student, status: :ok
    end

    def destroy
        student = find_student
        student.destroy
        head :no_content
    end

    def create
        student = Student.create(student_params)
        render json: student, status: :created
    end

    private

    def find_student
        Student.find(params[:id])
    end

    def student_params
        params.permit(:name, :major, :age)
    end

    def render_not_found_response
        render json: {error: "Student not found"}, status: :not_found
    end
end
