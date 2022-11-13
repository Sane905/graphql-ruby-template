class User < ApplicationRecord
  self.primary_key = :uid
  before_validation(on: :create) do
    self.uid = compute_checksum(SecureRandom.uuid)
  end
end

# == Schema Information
#
# Table name: users
#
#  uid        :string           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
