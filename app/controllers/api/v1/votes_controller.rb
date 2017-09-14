class Api::V1::VotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Vote.where(review_id: params[:review_id])
  end
  def show
    render json: Vote.find(params[:id])
  end
  def create
    data = JSON.parse(request.body.read)
    vote = Vote.find_by(user_id: data["user_id"]["id"], review_id: data["review_id"])
    if vote.nil?
      vote = Vote.create(
        review_id: data["review_id"],
        user_id: data["user_id"]["id"],
        vote_number: data["vote_number"]
      )
      render json: vote
    elsif vote.vote_number != data["vote_number"]
      Vote.find_by(user_id: data["user_id"]["id"], review_id: data["review_id"]).update(
        vote_number: data["vote_number"]
      )
      render json: vote
    end
  end
end
