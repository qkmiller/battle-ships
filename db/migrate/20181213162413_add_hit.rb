class AddHit < ActiveRecord::Migration[5.2]
  def change
    add_column :cells, :hit, :boolean
  end
end
