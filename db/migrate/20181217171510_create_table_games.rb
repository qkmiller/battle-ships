class CreateTableGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.column :player_1_name, :string
      t.column :player_2_name, :string
      t.column :winner, :string
    end
  end
end
