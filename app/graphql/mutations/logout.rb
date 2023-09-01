module Mutations
  class Logout < BaseMutation
   type Boolean

   def resolve
    require_user_login!


    # context[:session][:session_uid] = nil
    delete_auth_session(current_user)
    true
   end

   private

   def delete_auth_session(user)
     auth_session = user.auth_sessions.by_token(context[:cookies][:token]).first
     auth_session.destroy if auth_session.present?

     context[:cookies].delete(:user_uid)
     context[:cookies].delete(:token)
   end
  end
end
