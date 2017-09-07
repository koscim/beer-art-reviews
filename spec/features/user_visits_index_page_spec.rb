require 'rails_helper'


@art_label = FactoryGirl.create(:art_label)
@review = FactoryGirl.create(:review, art_label: @art_label)
@vote = FactoryGirl.create(:vote)
binding.pry
