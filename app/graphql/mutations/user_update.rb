# frozen_string_literal: true

module Mutations
  class UserUpdate < BaseMutation
    null false
    type Types::UserType

    argument :user_uid, ID, required: true
    argument :user_input, Types::Inputs::UserInputType, required: true

    def resolve(user_uid:, user_input:)
      user = ::User.find(user_uid)
      raise GraphQL::ExecutionError.new "Error updating user", extensions: user.errors.to_hash unless user.update(**user_input)

      user
    end
  end
end
