class AddGameIdColumnToCells < ActiveRecord::Migration[5.2]
  def change
    change_table :cells do |t|
      t.column :game_id, :int
    end
  end
end
