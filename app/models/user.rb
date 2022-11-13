class User < ApplicationRecord
  self.primary_key = :uid
  before_validation(on: :create) do
    self.uid = compute_checksum(SecureRandom.uuid)
  end
end
