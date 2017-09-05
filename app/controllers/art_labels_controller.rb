class ArtLabelsController < ApplicationController
  def index
    @art_labels = ArtLabel.all
  end
end
