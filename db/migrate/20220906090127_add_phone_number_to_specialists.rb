class AddPhoneNumberToSpecialists < ActiveRecord::Migration[7.0]
  def change
    add_column :specialists, :phone_number, :string
  end
end
