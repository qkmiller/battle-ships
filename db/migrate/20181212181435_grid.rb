class Grid < ActiveRecord::Migration[5.2]
  def change
    create_table :grid do |t|
      t.column :x, :int
      t.column :y, :int
      t.column :ship, :boolean
    end
  end
end
