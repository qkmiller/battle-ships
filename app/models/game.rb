class Game < ActiveRecord::Base
  has_many :cells
  def create_game(p1_name)
    self.update({:player_1_name => p1_name})
  end
end
