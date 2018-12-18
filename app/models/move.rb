class Move < ActiveRecord::Base

  def self.who_turn
    if Move.last == nil
      "Player 1 turn"
      @player_id = 1
    elsif Move.last.player_id == 1
      "Player 2 turn"
      @player_id = 2
    elsif Move.last.player_id == 2
      "Player 1 turn"
      @player_id = 1
    end
  end

  def self.make_move(lat,long)
    player = Move.who_turn
    opponent = Move.opponent
    hit_cell = Cell.where(x:lat, y:long, player: opponent).first
    hit_cell.hit = true
    hit_cell.save()
    if  (Cell.where(x:lat, y:long, player: opponent).first.ship == true)
      Move.create(player_id: player, x: lat, y: long, hit: true)
    else
      Move.create(player_id: player, x: lat, y: long, hit: false)
    end
  end

  def self.opponent
    if @player_id == 1
      2
    else
      1
    end
  end


end
