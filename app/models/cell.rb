class Cell < ActiveRecord::Base
  def self.create_grid
    a = [1,2,3]
    b = [1,2,3]
    c = [1,2]
    a.each do |n|
      b.each do |m|
        c.each do |o|
          Cell.create({x:(m), y:(n), player:(o), ship: false})
        end
      end
    end
  end

  def self.pick_random
    c = Cell.where(player:1).order("RANDOM()").first
    c.ship = true
    c.save
    d = Cell.where(player:2).order("RANDOM()").first
    d.ship = true
    d.save
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
