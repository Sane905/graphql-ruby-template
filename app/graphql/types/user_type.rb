# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :uid, ID, null: false
    field :user_name, String, null: true
    field :email, String, null: true
    field :refresh_token, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :posts, [Types::PostType], null: false
    def posts
      object.posts
    end
  end
end
