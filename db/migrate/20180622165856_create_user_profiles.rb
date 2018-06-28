class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.belongs_to :user, index: true

      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""

      t.string :phone_number

      t.integer :identities, null: false, array: true, default: []

      t.boolean :montessori_certified, null: false, default: false
      t.integer :montessori_certifying_body, null: false, array: true, default: []

      t.integer :race_and_ethnicity, array: true, default: []
      t.integer :childhood_household_income
      t.integer :parents_highest_education

      t.timestamps null: false
    end
  end
end
