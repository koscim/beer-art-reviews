class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    mail(
      to: review.art_label.user.email,
      subject: "New Review for #{review.art_label.name}"
    )
  end
end
