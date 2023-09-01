module Mutations
  class SignUp < BaseMutation
    null false
    type Types::UserType

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:, password:)
      if user = User.find_by(email: email)
        user.password = password
        user.save!
      else
        user = User.create!(email: email, password: password)
      end
      # context[:session][:session_uid] = user.uid
      create_auth_session_set_cookies(user)

      user
    end

    private

    def create_auth_session_set_cookies(user)
      auth_session = AuthSession.create(user_uid: user.uid)
      context[:cookies].permanent[:user_uid] = user.uid
      context[:cookies].permanent[:token] = auth_session.token
    end
  end
end
