class AddCoordinatesToSpecialist < ActiveRecord::Migration[7.0]
  def change
    add_column :specialists, :latitude, :float
    add_column :specialists, :longitude, :float
  end
end
