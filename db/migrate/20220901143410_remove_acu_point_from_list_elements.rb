class RemoveAcuPointFromListElements < ActiveRecord::Migration[7.0]
  def change
    remove_reference :list_elements, :acupoint, null: false, foreign_key: true
  end
end
