# == Schema Information
#
# Table name: payments
#
#  amount     :integer          not null
#  uid        :string           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Payment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
