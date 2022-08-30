class ChangeListsToListElements < ActiveRecord::Migration[7.0]
  def change
    rename_table :lists, :list_elements
  end
end
