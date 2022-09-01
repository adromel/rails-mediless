class AddListableToListElements < ActiveRecord::Migration[7.0]
  def change
    add_reference :list_elements, :listable, polymorphic: true, null: false
  end
end
