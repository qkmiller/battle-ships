class CreateCells < ActiveRecord::Migration[5.2]
  def change
    create_table :cells do |t|
      t.column :x, :int
      t.column :y, :int
      t.column :ship, :boolean
    end
  end
end
