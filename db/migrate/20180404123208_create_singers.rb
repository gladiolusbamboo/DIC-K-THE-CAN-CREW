class CreateSingers < ActiveRecord::Migration[5.1]
  def change
    create_table :singers do |t|
      t.string :name
      t.boolean :is_kick

      t.timestamps
    end
  end
end
