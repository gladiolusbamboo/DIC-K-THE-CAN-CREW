class CreateCds < ActiveRecord::Migration[5.1]
  def change
    create_table :cds do |t|
      t.string :name
      t.date :released_at

      t.timestamps
    end
  end
end
