class Api::V1::VotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Vote.where(review_id: params[:review_id])
  end
  def show
  end
  def create
    data = JSON.parse(request.body.read)
    vote = Vote.find_by(user_id: data["user_id"])
    if vote.nil?
      vote = Vote.create(
        review_id: data["review_id"],
        user_id: data["user_id"]["id"],
        vote_number: data["vote_number"]
      )
    end
  end
end
