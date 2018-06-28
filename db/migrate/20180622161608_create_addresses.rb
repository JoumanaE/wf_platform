class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country

      t.float :latitude
      t.float :longitude

      t.integer :addressable_id   #foreign key
      t.string  :addressable_type #type

      t.references :addressable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
