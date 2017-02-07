class Admin::CoursesController < ApplicationController
  layout "admin"

  def index
    @courses = Course.all
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

  def destroy
    course = Course.find(params[:id])
    course.destroy
    flash[:success] = "Course destroyed."
    redirect_to admin_courses_path    
  end  
  
  private

  def course_params
    params.require(:course).permit(:name, :price, :course_type, :image)
  end 

end