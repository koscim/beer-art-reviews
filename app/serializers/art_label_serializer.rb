class ArtLabelSerializer < ActiveModel::Serializer
  attributes :id, :name, :label_photo, :brewery, :beer_style,
    :art_style, :container_type, :beer_description, :art_description,
    :beer_rating, :user

    has_many :reviews
end
