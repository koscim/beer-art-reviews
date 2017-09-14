class Api::V1::ReviewsController < ApplicationController
  def index
    render json: Review.where(art_label_id: params[:art_label_id])
  end
  def show
    # render json: Review.find(params[:id])
    review_data = {
      review: Review.find(params[:id]),
      current_user: current_user,
      votes: Vote.where(review_id: params[:id])
     }
    render json: review_data
  end
end
