class RemoveListableIdFromListElements < ActiveRecord::Migration[7.0]
  def change
    remove_column :list_elements, :listable_id, :bigint
  end
end
