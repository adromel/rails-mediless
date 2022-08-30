class CreateJoinTableAcupointTreatment < ActiveRecord::Migration[7.0]
  def change
    create_join_table :acupoints, :symptoms, table_name: :acupoint_treatments do |t|
      t.index [:acupoint_id, :symptom_id], name: 'acupoint_symptom_index'
      t.index [:symptom_id, :acupoint_id], name: 'symptom_acupoint_index'
    end
  end
end
