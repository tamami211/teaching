class StudentsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :index, :show]
    def index
      if params[:search] != nil && params[:search] != ''
        search = params[:search]
        @students = Student.where("student_name LIKE ? OR sex LIKE ? OR subject LIKE ? OR grade LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") .page(params[:page]).per(6)   
      else
        @students= Student.all.page(params[:page]).per(6)
    end
  end
  
    def new
      @student = Student.new
    end

    def create
        student = Student.new(student_params)
        student.user_id = current_user.id
        if student.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @student = Student.find(params[:id])
        @comments = @student.comments
        @comment = Comment.new
        
      end

      def edit
        @student = Student.find(params[:id])
      end

      def update
        student = Student.find(params[:id])
        if student.update(student_params)
          redirect_to :action => "show", :id => student.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        student = Student.find(params[:id])
        student.destroy
        redirect_to action: :index
      end

    private
    def student_params
      params.require(:student).permit(:student_name, :sex, :grade, :subject, :image)
    end
end
