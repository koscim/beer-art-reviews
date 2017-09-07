class ArtLabelsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show, :new, :create]

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
    @art_label.user = current_user

    if @art_label.save
      redirect_to @art_label, notice: "Art Label Successfully Posted!"
    else
      flash[:notice] = @art_label.errors.full_messages.join(', ')
      render action: 'new'
    end
  end

  private

  def art_label_params
    params.require(:art_label).permit(:name, :image_url, :brewery, :beer_style, :art_style, :container_type, :beer_description, :art_description, :beer_rating)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found (Admin)")
    end
  end
end
