class AddParentIdToPages < ActiveRecord::Migration[7.0]
  def change
    add_reference :pages, :parent, null: true, foreign_key: { to_table: :pages, on_delete: :cascade }
  end
end
