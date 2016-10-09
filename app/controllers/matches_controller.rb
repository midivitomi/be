class MatchesController < ApplicationController
  def index
    competitions = params[:competitions].split(',')

    matches = Matche.where(group_id: competitions)

    render json: matches

  end
end
