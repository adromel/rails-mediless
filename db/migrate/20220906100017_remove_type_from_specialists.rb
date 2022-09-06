class RemoveTypeFromSpecialists < ActiveRecord::Migration[7.0]
  def change
    remove_column :specialists, :type, :string
  end
end
