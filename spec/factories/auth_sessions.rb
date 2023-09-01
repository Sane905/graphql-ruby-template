# == Schema Information
#
# Table name: auth_sessions
#
#  last_accessed_at :datetime         not null
#  token            :string           not null
#  uid              :string           not null, primary key
#  user_uid         :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_auth_sessions_on_token  (token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_7abb33e8dc  (user_uid => users.uid) ON DELETE => cascade ON UPDATE => cascade
#
FactoryBot.define do
  factory :auth_session do
    
  end
end
