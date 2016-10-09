class CompetitionsController < ApplicationController

  def index
    competitions = Competition.all
    render json: competitions
  end

end
