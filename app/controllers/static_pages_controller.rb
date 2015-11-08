class StaticPagesController < ApplicationController
  def home
  end

  def lookup
      @students = Student.search(params[:search])
  end
end
