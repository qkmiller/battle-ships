class Game < ActiveRecord::Base
  has_many :cells
  def create_game(p1_name, p2_name)
    self.update({:player_1_name => p1_name, :player_2_name => p2_name})


  end
end
