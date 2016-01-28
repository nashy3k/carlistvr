class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.text :cartype
      t.text	:model
      t.integer	:year
      t.text	:color
      t.text	:price
      t.integer	:mileage
      t.text	:sound_system
      t.text	:tinting
      t.text	:security_lock
      t.text	:description

      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :listings, :users
    add_index :listings, [:user_id, :created_at]
    add_index	:listings, :mileage
    add_index	:listings, :model
    add_index	:listings, :color
    add_index :listings, :price

  end
end
