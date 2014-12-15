class Player

  def is_health_low(warrior)
    @need_full_rest = false if warrior.health > 18 or @need_full_rest.nil?
    @need_full_rest = true  if warrior.health < 10
    return warrior.health < (@need_full_rest ? 20 : 10)
  end

  def play_turn(warrior)
    @last_health = warrior.health if @last_health.nil?
    @walking_direction = :backward if @walking_direction.nil?
    
    is_under_attack = (warrior.health < @last_health)

    feeling = warrior.feel(@walking_direction)
    @walking_direction = :forward if feeling.wall?

    if feeling.captive?
      warrior.rescue!(@walking_direction)
    elsif feeling.enemy?
      warrior.attack!(@walking_direction)
    else 
      if is_health_low(warrior)
        if is_under_attack
          warrior.walk!(:backward)
        else
          warrior.rest!
        end
      else
        warrior.walk!(@walking_direction)
      end
    end
    @last_health = warrior.health
  end
end

