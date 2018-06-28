class CreateHubsPodsSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :regions do |t|
      t.string :name, null: false, default: ""
      t.string :code, null: false, default: ""

      t.string :type, null: false
    end

    create_table :hubs do |t|
      t.string :name, null: false, default: ""
    end

    create_table :pods do |t|
      t.belongs_to :hub, index: true

      t.string :name, null: false, default: ""
    end

    create_table :schools do |t|
      t.belongs_to :hub, index: true
      t.belongs_to :pod, index: true

      t.string :name, null: false, default: ""
    end
  end
end
