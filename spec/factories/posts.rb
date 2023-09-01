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
FactoryBot.define do
  factory :post do
    
  end
end
