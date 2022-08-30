class CreateEssentialOils < ActiveRecord::Migration[7.0]
  def change
    create_table :essential_oils do |t|
      t.string :name
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
