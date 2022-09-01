class RemoveEssentialOilFromListElements < ActiveRecord::Migration[7.0]
  def change
    remove_reference :list_elements, :essential_oil, null: false, foreign_key: true
  end
end
