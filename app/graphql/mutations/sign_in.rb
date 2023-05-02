module Mutations
  class SignIn < BaseMutation
    null false
    type Types::UserType

    argument :id_token, String, required: true
    argument :refresh_token, String, required: true

    def resolve(id_token:, refresh_token:)
      setting_session(id_token, refresh_token)
      user = find_form_id_token!
      user
    end
  end
end
