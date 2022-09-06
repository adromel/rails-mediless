class AddTypeToSpecialists < ActiveRecord::Migration[7.0]
  def change
    add_column :specialists, :type, :string
  end
end
