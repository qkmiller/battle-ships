class AddHitColumnToCells < ActiveRecord::Migration[5.2]
  def change
    change_table :cells do |t|
      t.column :hit, :boolean
    end
  end
end
