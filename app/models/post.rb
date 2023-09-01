class Post < ApplicationRecord

    belongs_to :user,
    foreign_key: :user_uid,
    primary_key: :uid,
    optional: false

    self.primary_key = :uid
    before_validation(on: :create) do
      self.uid = Digest::UUID.uuid_v4.tr('-', '')
    end
end

# == Schema Information
#
# Table name: posts
#
#  message    :string           not null
#  title      :string           not null
#  uid        :string           not null, primary key
#  user_uid   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Foreign Keys
#
#  fk_rails_53cbe28ed0  (user_uid => users.uid) ON DELETE => cascade ON UPDATE => cascade
#
