class User < ApplicationRecord
  self.primary_key = :uid
  before_validation(on: :create) do
    self.uid = Digest::UUID.uuid_v4.tr('-', '')
  end

end

# == Schema Information
#
# Table name: users
#
#  email         :string
#  refresh_token :string           not null
#  uid           :string           not null, primary key
#  user_name     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_users_on_email          (email) UNIQUE
#  index_users_on_refresh_token  (refresh_token) UNIQUE
#  index_users_on_user_name      (user_name) UNIQUE
#
