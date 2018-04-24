class CreateSearchLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :search_logs do |t|
      t.string :searchword
      t.string :searchtype

      t.timestamps
    end
  end
end
