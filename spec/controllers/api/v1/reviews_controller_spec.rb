require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  describe "GET#index" do
    it "should return a list of all the Reviews for a particular Art Label" do
      review = FactoryGirl.create(:review)
      art_label_id = review.art_label.id

      get :index, params: { art_label_id: art_label_id }
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 1

      expect(returned_json["reviews"][0]["feels"]).to eq review.feels
      expect(returned_json["reviews"][0]["intoxication_level"]).to eq review.intoxication_level
      expect(returned_json["reviews"][0]["joy"]).to eq review.joy
      expect(returned_json["reviews"][0]["fear"]).to eq review.fear
      expect(returned_json["reviews"][0]["sadness"]).to eq review.sadness
      expect(returned_json["reviews"][0]["disgust"]).to eq review.disgust
      expect(returned_json["reviews"][0]["anger"]).to eq review.anger
      expect(returned_json["reviews"][0]["cleverness"]).to eq review.cleverness
      expect(returned_json["reviews"][0]["collectability"]).to eq review.collectability
      expect(returned_json["reviews"][0]["controversiality"]).to eq review.controversiality
      expect(returned_json["reviews"][0]["buyability"]).to eq review.buyability

      expect(returned_json["reviews"][0]["art_label"]["name"]).to eq review.art_label.name
      expect(returned_json["reviews"][0]["art_label"]["brewery"]).to eq review.art_label.brewery
      expect(returned_json["reviews"][0]["art_label"]["image_url"]).to eq review.art_label.image_url
      expect(returned_json["reviews"][0]["art_label"]["beer_style"]).to eq review.art_label.beer_style
      expect(returned_json["reviews"][0]["art_label"]["art_style"]).to eq review.art_label.art_style
      expect(returned_json["reviews"][0]["art_label"]["container_type"]).to eq review.art_label.container_type
      expect(returned_json["reviews"][0]["art_label"]["beer_description"]).to eq review.art_label.beer_description
      expect(returned_json["reviews"][0]["art_label"]["art_description"]).to eq review.art_label.art_description
      expect(returned_json["reviews"][0]["art_label"]["beer_rating"]).to eq review.art_label.beer_rating

      expect(returned_json["reviews"][0]["user"]["username"]).to eq review.user.username
      expect(returned_json["reviews"][0]["user"]["first_name"]).to eq review.user.first_name
      expect(returned_json["reviews"][0]["user"]["last_name"]).to eq review.user.last_name
      expect(returned_json["reviews"][0]["user"]["role"]).to eq review.user.role

    end
  end
end
