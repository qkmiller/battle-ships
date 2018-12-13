class Game < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.column :player_id, :int
      t.column :x, :int
      t.column :y, :int
      t.column :hit, :boolean

      t.timestamps
    end
  end
end
