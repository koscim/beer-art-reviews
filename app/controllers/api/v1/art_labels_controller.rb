class Api::V1::ArtLabelsController < ApplicationController
  def index
    render json: ArtLabel.all
  end
  def show
    render json: ArtLabel.find(params[:id])
  end
  def create
    binding.pry
  end
end
