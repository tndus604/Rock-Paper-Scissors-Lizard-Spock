# history.rb

class History
    attr_accessor :plays, :opponent_plays, :score
  
    def initialize
      @plays = []
      @opponent_plays = []
      @score = 0
    end
  
    def log_play(move)
      @plays << move
    end
  
    def log_opponent_play(move)
      @opponent_plays << move
    end
  
    def add_score
      @score += 1
    end
end
  