class CreateAcupoints < ActiveRecord::Migration[7.0]
  def change
    create_table :acupoints do |t|
      t.string :name
      t.string :coordinates

      t.timestamps
    end
  end
end
