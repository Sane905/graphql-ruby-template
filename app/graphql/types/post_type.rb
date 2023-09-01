# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :uid, ID, null: false
    field :title, String, null: true
    field :message, String, null: true
  end
end
