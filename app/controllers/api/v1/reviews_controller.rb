class Api::V1::ReviewsController < ApplicationController
  def index
    render json: Review.where(art_label_id: params[:art_label_id])
  end
  def show
    render json: Review.find(params[:id])
  end
end
