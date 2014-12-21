class Player

  def is_health_low(warrior)
    @need_full_rest = false if warrior.health > 18 or @need_full_rest.nil?
    @need_full_rest = true  if warrior.health < 10
    return warrior.health < (@need_full_rest ? 20 : 10)
  end

  def play_turn(warrior)
    @last_health = warrior.health if @last_health.nil?
    
    is_under_attack = (warrior.health < @last_health)

    if warrior.feel.wall?
      warrior.pivot!
    elsif warrior.feel.enemy?
      warrior.attack!
    elsif is_health_low(warrior)
      if is_under_attack
        warrior.walk!(:backward)
      else
        warrior.rest!
      end
    else
      warrior.walk!
    end
    @last_health = warrior.health
  end

end
