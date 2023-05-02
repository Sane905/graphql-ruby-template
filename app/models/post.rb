class Post < ApplicationRecord
    self.primary_key = :uid
    before_validation(on: :create) do
      self.uid = Digest::UUID.uuid_v4.tr('-', '')
    end

    belongs_to :user,
    foreign_key: :user_uid,
    primary_key: :uid
end

# == Schema Information
#
# Table name: posts
#
#  message    :string           not null
#  uid        :string           not null, primary key
#  user_uid   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_user_uid  (user_uid)
#
# Foreign Keys
#
#  fk_rails_53cbe28ed0  (user_uid => users.uid)
#
