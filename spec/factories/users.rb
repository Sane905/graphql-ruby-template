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
FactoryBot.define do
  factory :user do
    
  end
end
