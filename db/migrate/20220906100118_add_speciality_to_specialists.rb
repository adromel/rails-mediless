class AddSpecialityToSpecialists < ActiveRecord::Migration[7.0]
  def change
    add_column :specialists, :speciality, :string
  end
end
