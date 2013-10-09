class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :character
      t.references :movie, index: true
      t.references :star, index: true

      t.timestamps
    end
  end
end
