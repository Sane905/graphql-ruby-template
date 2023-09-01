class AuthSession < ApplicationRecord
    LAST_ACCESSED_UPDATE_MINITE = 60
    LAST_ACCESSED_EXPIRATION_DAY = 60
    SESSION_TOKEN_EXPIRATION_DAY = 365 * 5

    belongs_to :user,
    foreign_key: :user_uid,
    primary_key: :uid,
    optional: false

    validates :token, presence: true, uniqueness: true
    validates :last_accessed_at, presence: true

    scope :by_token, ->(token) { where(token: token) }
    scope :within_expiration_date, -> {
        where('last_accessed_at >= ? and auth_sessions.created_at >= ?',
            Time.current.ago(LAST_ACCESSED_EXPIRATION_DAY.days),
            Time.current.ago(SESSION_TOKEN_EXPIRATION_DAY.days))
        }

    self.primary_key = :uid
    before_validation(on: :create) do
      self.uid = Digest::UUID.uuid_v4.tr('-', '')
      self.token = Digest::UUID.uuid_v4.tr('-', '')
      self.last_accessed_at = Time.current
    end

    def save_reseted_last_accessed_at
      return if Time.current.ago(LAST_ACCESSED_UPDATE_MINITE.minutes) < last_accessed_at

      self.last_accessed_at = Time.current
      save
    end



end

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
