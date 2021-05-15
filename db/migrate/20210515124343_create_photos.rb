# frozen_string_literal: true

# rubocop:todo Style/Documentation
class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :tagline
      t.integer :album_id

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
