module Mutations
    class CreatePost < BaseMutation
     type Types::PostType
  
     argument :title, String, required: true
     argument :message, String, required: true

     def resolve(title:, message:)
      require_user_login!

      current_user.posts.create!(title: title, message: message)
      current_user.posts.order(created_at: :desc).first
     end
    end
end
  