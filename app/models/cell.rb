class Cell < ActiveRecord::Base
  def self.create_grid
    a = [1,2,3]
    b = [1,2,3]
    c = [1,2,3]
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
    p1_ships_hit = Cell.where(player: 1, ship: true, hit: true).count
    p2_ships_hit = Cell.where(player: 2, ship: true, hit: true).count
    @total_ship = Cell.where(player: 1, ship: true).count
    if p1_ships_hit == @total_ship
    message = "p1 wins"
    elsif p2_ships_hit == @total_ship
    message = "p2 wins"
    else
      message = "game continiues"
    end
    message
  end

  # refactor of self.win_check
  def self.count_true
    player_one_ship = Cell.where(player: 1, ship: true, hit: true).count
    player_two_ship = Cell.where(player: 2, ship: true, hit: true).count
    @total_ship = Cell.where(player: 1, ship: true).count
    if player_one_ship == @total_ship
      message = "Player One You Win!"
    elsif player_two_ship == @total_ship
      message = "Player Two You Win!"
    else
      message = "game continiues"
    end
  end


end
