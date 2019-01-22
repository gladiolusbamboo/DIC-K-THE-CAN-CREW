class AddColumnCds < ActiveRecord::Migration[5.1]
  def change
    add_column :cds, :img_name, :string
  end
end
