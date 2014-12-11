class Player

  def play_turn(warrior)
    @health = 0 if @health.nil? 
    @has_rescued = false if @has_rescued.nil?
    @needed_health_level = 10 if @needed_health_level.nil?

    feel_back = warrior.feel(:backward)

    if !@has_rescued
      if !feel_back.wall?
        if feel_back.captive?
          warrior.rescue!(:backward)
          @has_rescued = true
        else  
          warrior.walk!(:backward)  
        end
      end
    elsif warrior.feel.empty?
      if warrior.health < @needed_health_level
        @needed_health_level = 20 if @needed_health_level = 10
        if warrior.health >= @health # if we are okay, not taking damage
          @needed_health_level = 10 if warrior.health >= 18
          warrior.rest!
        else # taking damage
          warrior.walk!(:backward)
        end
      else
        warrior.walk!
      end
    else
        warrior.attack!
    end
    @health  = warrior.health
  end
end
  