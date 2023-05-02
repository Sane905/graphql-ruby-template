module Mutations
  class Logout < BaseMutation
   type Boolean

   def resolve
    delete_session
    true
   end
  end
end
