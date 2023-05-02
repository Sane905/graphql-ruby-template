module Mutations
  class SignUp < BaseMutation
    null false
    type Types::UserType

    argument :id_token, String, required: true
    argument :refresh_token, String, required: true

    def resolve(id_token:, refresh_token:)
      setting_session(id_token, refresh_token)
      create_form_id_token!
    end
  end
end
