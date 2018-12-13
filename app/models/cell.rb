class Cell < ActiveRecord::Base
  def self.create_grid
    a = [1,2,3]
    b = [1,2,3]
    a.each do |n|
      b.each do |m|
      Cell.create({x:(m), y:(n), ship: false})
      end
    end
    c = Cell.order("RANDOM()").first
    c.ship = true
    c.save
  end

end
