class RemoveUnaccentFromSymptoms < ActiveRecord::Migration[7.0]
  def change
    remove_column :symptoms, :unaccent, :string
  end
end
