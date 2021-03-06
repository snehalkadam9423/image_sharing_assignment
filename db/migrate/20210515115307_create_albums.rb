# frozen_string_literal: true

# rubocop:todo Style/Documentation
class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
