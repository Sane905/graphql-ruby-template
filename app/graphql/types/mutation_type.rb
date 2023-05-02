module Types
  class MutationType < Types::BaseObject
    field :logout, mutation: Mutations::Logout
    field :sign_in, mutation: Mutations::SignIn
    field :sign_up, mutation: Mutations::SignUp
    field :user_update, mutation: Mutations::UserUpdate
  end
end
