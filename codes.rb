class Player

  def play_turn(warrior)
    if warrior.feel.captive?
      warrior.rescue!
    elsif warrior.look[1].enemy? 
      warrior.shoot!
    else
      warrior.walk!
    end
  end   
end
