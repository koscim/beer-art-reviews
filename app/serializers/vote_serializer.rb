class VoteSerializer < ActiveModel::Serializer
  attributes :id, :review_id, :user_id, :vote_number
end
