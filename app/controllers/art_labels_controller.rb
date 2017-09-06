class ArtLabelsController < ApplicationController

  # before_action :authenticate_user!

  def index
    @art_labels = ArtLabel.all
  end

  def show
    @art_label = ArtLabel.find(params[:id])
  end

  def new
    @art_label = ArtLabel.new
  end

  def create
    @art_label = ArtLabel.new(art_label_params)

    if @art_label.save
      redirect_to @art_label, notice: "Art Label Successfully Posted!"
    else
      flash[:notice] = @art_label.errors.full_messages.join(', ')
      render action: 'new'
    end
  end



  private

  def art_label_params
    params.require(:art_label).permit(:name, :image_url, :brewery, :beer_style, :art_style, :container_type, :beer_description, :art_description, :beer_rating, :user_id)
  end
end
