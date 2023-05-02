module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me

    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    field :connection_users, Types::UserType.connection_type, null: false
    def connection_users
      User.all
    end

    private

    def current_account
      context[:current_account]
    end
  end
end
