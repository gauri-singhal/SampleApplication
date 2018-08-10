# frozen_string_literal: true

class CommentSerializer < ActiveModel::Serializer
	belongs_to :post
  attributes :id, :body, :author, :post_id
end
