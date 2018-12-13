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

end
