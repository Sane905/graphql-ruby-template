# frozen_string_literal: true

module Types::Inputs
  class UserInputType < Types::BaseInputObject
    argument :user_name, String, required: false
  end
end
