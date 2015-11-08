require 'will_paginate/array'

class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.search(params[:search])
  end

  def transcript
    @student = Student.find(params[:id])
    @remaining_courses = []
    @completed_courses = @student.completes
    Course.all.each do |course|
      if !@student.completes.find_by(course_id: course.id)
        @remaining_courses << course
      end
    end
  
  end

  def show
    @remaining_courses = []
    @completed_courses = []
    Course.all.each do |course|
      if !@student.completes.find_by(course_id: course.id)
        @remaining_courses << course
      end
    end
    # @sort_field = params[:sort]
    # @remaining_courses.sort { |a,b| a.login_count <=> b.login_count }
    @remaining_courses = @remaining_courses.paginate(:per_page =>8, :page => params[:page])
    @completed_courses = @student.completes.paginate(:per_page =>8, :page =>1)
  end

  # GET /students/new
  def new
    @student = Student.new
    @courses = Course.all
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:fname, :lname, :email, completes_attributes: [ :id, :student_id, :course_id, :grade,  :_destroy ])
    end
end
