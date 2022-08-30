class CreateJoinTableOilTreatment < ActiveRecord::Migration[7.0]
  def change
    create_join_table :essential_oils, :symptoms, table_name: :oil_treatments do |t|
      t.index [:essential_oil_id, :symptom_id], name: 'oil_symptom_index'
      t.index [:symptom_id, :essential_oil_id], name: 'symptom_oil_index'
      t.text :posology
    end
  end
end
