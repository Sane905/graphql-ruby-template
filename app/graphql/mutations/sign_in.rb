module Mutations
  class SignIn < BaseMutation
    null false
    type Types::UserType

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:, password:)
      # context[:session][:session_uid] = nil
      delete_auth_session

      begin
        user = User.authenticate(email, password)
      rescue ActiveRecord::RecordNotFound => e
        raise GraphQL::ExecutionError.new(e.message, extensions: { code: 404 })
      end

      # context[:session][:session_uid] = user.uid
      create_auth_session_set_cookies(user)

      user
    end

    private

    def delete_auth_session
      context[:cookies].delete(:user_uid)
      context[:cookies].delete(:token)
    end

    def create_auth_session_set_cookies(user)
      auth_session = AuthSession.create(user_uid: user.uid)
      context[:cookies].permanent[:user_uid] = user.uid
      context[:cookies].permanent[:token] = auth_session.token
    end
  end
end
