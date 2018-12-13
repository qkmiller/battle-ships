class UpdateCells < ActiveRecord::Migration[5.2]
  def change
    change_table :cells do |t|
      t.column :player, :integer
    end
  end
end
