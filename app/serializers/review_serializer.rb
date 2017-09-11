class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :feels, :intoxication_level, :joy, :fear,
    :sadness, :disgust, :anger, :cleverness, :collectability,
    :controversiality, :buyability, :user, :art_label
end
