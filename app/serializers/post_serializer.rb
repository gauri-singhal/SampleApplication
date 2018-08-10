# frozen_string_literal: true

class PostSerializer < ActiveModel::Serializer
  has_many :comments
  attributes :id, :title, :content, :user_id
end
