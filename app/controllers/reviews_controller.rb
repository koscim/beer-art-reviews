class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @art_label = ArtLabel.find(params[:art_label_id])
    @review.art_label = @art_label
    @full_name = "#{@review.user.first_name} #{@review.user.last_name}"
    if @review.save
      ReviewMailer.new_review(@review).deliver_now
      redirect_to @art_label, notice: "Review Submitted Successfully!"
    else
      flash[:notice] = @review.errors.full_messages.join(', ')
      redirect_to @art_label
    end
  end

  def edit
    @review = Review.find(params[:id])
    @art_label = @review.art_label
  end

  def update
    @review = Review.find(params[:id])
    @art_label = @review.art_label
    if current_user == @review.user
      if @review.update(review_params)
        redirect_to @art_label, notice: "Review Successfully Updated!"
      else
        flash[:notice] = @review.errors.full_messages.join(', ')
        render action: 'edit'
      end
    else
      flash[:notice] = "Invalid user. You didn't create this!"
      render action: 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @art_label = @review.art_label
    if current_user == @review.user || current_user.role == 'admin'
      @art_label = ArtLabel.find(params[:art_label_id])
      @review.destroy
      redirect_to art_label_path(@art_label)
    else
      flash[:notice] = "Invalid user. You didn't create this!"
      redirect_to @art_label
    end
  end

  private

  def review_params
    params.require(:review).permit(:feels, :intoxication_level, :joy, :fear, :sadness, :disgust, :anger, :cleverness, :collectability, :controversiality, :buyability)
  end
end
