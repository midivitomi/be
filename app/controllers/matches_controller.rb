class MatchesController < ApplicationController
  def index
    competitions = params[:competitions].split(',')

    competitions = Competition.where(id: competitions)
    matches = []
    competitions.each do |item|
      matches.push(item.matches.to_json)
    end

    render json: matches

  end
end
