# frozen_string_literal: true

module Types
    class PostType < Types::BaseObject
    field :uid, ID, null: false
    field :message, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
end