class Player

  def play_turn(warrior)
    @last_health = warrior.health if @last_health.nil?
    @walking_direction = :backward if @walking_direction.nil?
    
    is_under_attack = (warrior.health < @last_health)
    is_health_low = (warrior.health < 10)

    feeling = warrior.feel(@walking_direction)
    @walking_direction = :forward if feeling.wall?

    if feeling.captive?
      warrior.rescue!(@walking_direction)
    elsif feeling.enemy?
      warrior.attack!(@walking_direction)
    else 
      if is_health_low
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

