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

      expect(returned_json.length).to eq 2
      expect(returned_json["art_labels"][0]["name"]).to eq art_label.name
      expect(returned_json["art_labels"][0]["brewery"]).to eq art_label.brewery
      expect(returned_json["art_labels"][0]["label_photo"]["url"]).to eq art_label.label_photo.url
      expect(returned_json["art_labels"][0]["beer_style"]).to eq art_label.beer_style
      expect(returned_json["art_labels"][0]["art_style"]).to eq art_label.art_style
      expect(returned_json["art_labels"][0]["container_type"]).to eq art_label.container_type
      expect(returned_json["art_labels"][0]["beer_description"]).to eq art_label.beer_description
      expect(returned_json["art_labels"][0]["art_description"]).to eq art_label.art_description
      expect(returned_json["art_labels"][0]["beer_rating"]).to eq art_label.beer_rating
    end
  end
end
