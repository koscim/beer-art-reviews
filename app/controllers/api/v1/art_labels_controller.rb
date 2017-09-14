class Api::V1::ArtLabelsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    art_label_data = {
      art_labels: ArtLabel.all,
      current_user: current_user
     }
    # render json: ArtLabel.all
    render json: art_label_data
  end
  def show
    render json: ArtLabel.find(params[:id])
  end
  def create
  end
  def destroy
    art_label = ArtLabel.find(params[:id])
    reviews = art_label.reviews
    if current_user == art_label.user || current_user.role == 'admin'
      art_label.destroy
      reviews.each do |review|
        review.destroy
      end
    end
  end
end
