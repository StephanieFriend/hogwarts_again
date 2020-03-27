class ProfessorsController < ApplicationController

  def index
    @professors = Professor.all
  end

  def show
    # binding.pry
    @professor = Professor.find(params[:id])
  end
end