class RemoveListableTypeFromListElements < ActiveRecord::Migration[7.0]
  def change
    remove_column :list_elements, :listable_type, :string
  end
end
