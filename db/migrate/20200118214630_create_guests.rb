class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string  :name,         null: false
      t.integer :image_number, null: false, default: 0
      t.string  :color,        null: true,  limit: 6

      t.timestamps
    end
  end
end
