class RemoveNameFromListElements < ActiveRecord::Migration[7.0]
  def change
    remove_column :list_elements, :name, :string
  end
end
