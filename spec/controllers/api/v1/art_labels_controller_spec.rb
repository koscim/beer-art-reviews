require 'rails_helper'

RSpec.describe Api::V1::ArtLabelsController, type: :controller do
  describe "GET#index" do
    it "should return a list of all the Art Labels" do
      art_label = FactoryGirl.create(:art_label)
      FactoryGirl.create(:review, art_label: art_label)
      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 1

      expect(returned_json["art_labels"][0]["name"]).to eq art_label.name
      expect(returned_json["art_labels"][0]["brewery"]).to eq art_label.brewery
      expect(returned_json["art_labels"][0]["image_url"]).to eq art_label.image_url
      expect(returned_json["art_labels"][0]["beer_style"]).to eq art_label.beer_style
      expect(returned_json["art_labels"][0]["art_style"]).to eq art_label.art_style
      expect(returned_json["art_labels"][0]["container_type"]).to eq art_label.container_type
      expect(returned_json["art_labels"][0]["beer_description"]).to eq art_label.beer_description
      expect(returned_json["art_labels"][0]["art_description"]).to eq art_label.art_description
      expect(returned_json["art_labels"][0]["beer_rating"]).to eq art_label.beer_rating

      expect(returned_json["art_labels"][0]["user"]["first_name"]).to eq art_label.user.first_name
      expect(returned_json["art_labels"][0]["user"]["last_name"]).to eq art_label.user.last_name
      expect(returned_json["art_labels"][0]["user"]["username"]).to eq art_label.user.username
      expect(returned_json["art_labels"][0]["user"]["email"]).to eq art_label.user.email
      expect(returned_json["art_labels"][0]["user"]["role"]).to eq art_label.user.role

      expect(returned_json["art_labels"][0]["reviews"][0]["feels"]).to eq art_label.reviews[0].feels
      expect(returned_json["art_labels"][0]["reviews"][0]["intoxication_level"]).to eq art_label.reviews[0].intoxication_level
      expect(returned_json["art_labels"][0]["reviews"][0]["joy"]).to eq art_label.reviews[0].joy
      expect(returned_json["art_labels"][0]["reviews"][0]["fear"]).to eq art_label.reviews[0].fear
      expect(returned_json["art_labels"][0]["reviews"][0]["sadness"]).to eq art_label.reviews[0].sadness
      expect(returned_json["art_labels"][0]["reviews"][0]["disgust"]).to eq art_label.reviews[0].disgust
      expect(returned_json["art_labels"][0]["reviews"][0]["anger"]).to eq art_label.reviews[0].anger
      expect(returned_json["art_labels"][0]["reviews"][0]["cleverness"]).to eq art_label.reviews[0].cleverness
      expect(returned_json["art_labels"][0]["reviews"][0]["collectability"]).to eq art_label.reviews[0].collectability
      expect(returned_json["art_labels"][0]["reviews"][0]["controversiality"]).to eq art_label.reviews[0].controversiality
      expect(returned_json["art_labels"][0]["reviews"][0]["buyability"]).to eq art_label.reviews[0].buyability
    end
  end
end
