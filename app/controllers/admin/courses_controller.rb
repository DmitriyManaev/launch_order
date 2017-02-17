module Admin
  class CoursesController < BaseController
    before_action :find_course, only: [:edit, :update]

    def index
      @courses = Course.order(:course_type).all
    end
    
    def new
      @course = Course.new
    end
      
    def create
      @course = Course.new
      @course.assign_attributes(course_params)
      if @course.save
        flash[:success] = "Course added successfully!"
        redirect_to admin_courses_path
      else
        flash.now[:fail] = "Course not added!"
        render :new
      end   
    end

    def edit
    end

    def update
      if @course.update_attributes(course_params)
        flash[:success] = "Course updated."
        redirect_to admin_courses_path
      else
        flash[:fail] = "Course not updated. Check course params."
        render :edit
      end
    end
    
    private

    def course_params
      params.require(:course).permit(:name, :price, :course_type, :image)
    end 

    def find_course
      @course = Course.find(params[:id])
    end

  end
end