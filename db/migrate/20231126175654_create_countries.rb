# frozen_string_literal: true

class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string   :country_code
      t.string   :region

      t.timestamps
    end

    add_index :countries, :country_code, unique: true
    add_index :countries, :region
  end
end
