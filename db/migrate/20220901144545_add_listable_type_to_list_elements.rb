class AddListableTypeToListElements < ActiveRecord::Migration[7.0]
  def change
    add_reference :list_elements, :listable_type, polymorphic: true, null: false
  end
end
