class Player

  def play_turn(warrior)
    
    @last_health = warrior.health if @last_health.nil?
    @walking_direction = :backward if @walking_direction.nil?

    feeling = warrior.feel(@walking_direction)

    if feeling.wall?
      @walking_direction = :forward
    elsif feeling.captive?
      warrior.rescue!(@walking_direction)
    elsif feeling.enemy?
      warrior.attack!(@walking_direction)
    else 
      warrior.walk!(@walking_direction)
    end

  end
end

