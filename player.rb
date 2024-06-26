require_relative "element"
require_relative "history"

class Player
    attr_reader :name, :history
  
    def initialize(name, history)
        @name = name
        @history = history
    end
  
    def play
        fail "This method should be overridden"
    end
end

class StupidBot < Player
    def play
        move = Rock.new("Rock")
        @history.log_play(move)
        move
    end
end
  

class RandomBot < Player
    def play
        move = $moves.sample
        @history.log_play(move)
        move
    end
end

class IterativeBot < Player
    def initialize(name, history)
        super(name, history)
        @index = 0
    end
  
    def play
        move = $moves[@index]
        @index = (@index + 1) % $moves.length
        @history.log_play(move)
        move
    end
end

class LastPlayBot < Player
    def initialize(name, history)
      super(name, history)
      @last_opponent_move = nil  # Initializes with no last move
    end
  
    def play()
      # Play the move that was last played by the opponent, default to Rock on the first move
      move = @last_opponent_move || Rock.new("Rock")
      @history.log_play(move)
      move
    end
  
    def record_opponent_move(move)
      # Update the last move played by the opponent
      @last_opponent_move = move
      @history.log_opponent_play(move)
    end
end
  

class HumanPlayer < Player
    def play
        move = nil
        loop do
        puts "(1) Rock"
        puts "(2) Paper"
        puts "(3) Scissors"
        puts "(4) Lizard"
        puts "(5) Spock"
        print "Enter your move: "
        choice = gets.chomp.to_i
        if (1..5).include?(choice)
            move = $moves[choice - 1]
            break
        else
            puts "Invalid move - try again"
        end
        end
        @history.log_play(move)
        move
    end
end


# ===================== Test =====================

# p1 = StupidBot.new('StupidBot', History.new)
# p2 = RandomBot.new('RandomBot', History.new)
# p1move = p1.play()
# p2move = p2.play()
# puts p1move.compare_to(p2move)

# =============== Expected Outcome ===============

# Rock crushes Scissors, Win

# ================================================