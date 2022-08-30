class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :essential_oil, null: true, foreign_key: true
      t.references :acupoint, null: true, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
