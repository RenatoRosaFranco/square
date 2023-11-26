# frozen_string_literal: true

class Country < ApplicationRecord

  # Validations
  validates :country_code, presence: true, uniqueness: true
  validates :region, presence: true
end
