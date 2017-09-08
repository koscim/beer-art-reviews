class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @art_label = ArtLabel.find(params[:art_label_id])
    @review.art_label = @art_label
    if @review.save
      redirect_to @art_label, notice: "Review Submitted Successfully!"
    else
      flash[:notice] = @review.errors.full_messages.join(', ')
      redirect_to @art_label
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @art_label = ArtLabel.find(params[:art_label_id])
    @review.destroy
    redirect_to art_label_path(@art_label)
  end

  private

  def review_params
    params.require(:review).permit(:feels, :intoxication_level, :joy, :fear, :sadness, :disgust, :anger, :cleverness, :collectability, :controversiality, :buyability)
  end
end
