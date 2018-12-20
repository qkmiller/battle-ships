class Cell < ActiveRecord::Base
  belongs_to :game
  def self.create_grid(game_id)
    a = [1,2,3,4,5,6,7,8,9,10] #number of rows To change gameboard size
    b = [1,2,3,4,5,6,7,8,9,10] #number of columns To change gameboard size
    c = [1,2] #number of players
    a.each do |n|
      b.each do |m|
        c.each do |o|
          Cell.create({x:(m), y:(n), player:(o), ship: false, game_id: game_id})
        end
      end
    end
  end

  def self.pick_random
    12.times() do #number of enemy ships
      d = Cell.where(player:2, ship:false).order("RANDOM()").first
      d.ship = true
      d.save
    end
  end

  def self.win_check
    p1_ships = (Cell.all.select { |c| c.player == 1 } ).select { |s| s.ship == true }
    p1_ships_hit = ((Cell.all.select { |c| c.player == 1 } ).select { |s| s.ship == true }).select { |h| h.hit == true}
    p2_ships = (Cell.all.select { |c| c.player == 2 } ).select { |s| s.ship == true }
    p2_ships_hit = ((Cell.all.select { |c| c.player == 2 } ).select { |s| s.ship == true }).select { |h| h.hit == true}
    if p1_ships == p1_ships_hit
      message = "p2 wins"
    elsif p2_ships == p2_ships_hit
      message = "p1 wins"
    else
      message = "game continiues"
    end
    message
  end

end
