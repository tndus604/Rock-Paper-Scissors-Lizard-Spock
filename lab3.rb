require_relative "element"   # uncomment to load element.rb
require_relative "player"    # uncomment to load player.rb 
require_relative "history"   # uncomment to load history.rb

######################################### 	
#     CS 381 - Programming Lab #3		#
#										#
#  < Su Youn Jeon >					 	#
#  < jeonsu@oregonstate.edu >	        #
#										#
#########################################



# your code here

# Method to display a welcome message
def welcome_message
	puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
end
  
# Method to prompt the user to select a player
def select_player
	choice = gets.chomp.to_i
	case choice
	when 1
	  	StupidBot.new('StupidBot', History.new)
	when 2
	  	RandomBot.new('RandomBot', History.new)
	when 3
	  	IterativeBot.new('IterativeBot', History.new)
	when 4
	  	LastPlayBot.new('LastPlayBot', History.new)
	when 5
	  	HumanPlayer.new('Human', History.new)
	else
	  	# puts "Invalid choice - start over"
	  	# select_player(player_number)
		return nil
	end
	# puts "#{player1.name} vs. #{player2.name}"
end
  
  
# Method to play a single round of the game
def play_round(player1, player2, round_number)
	puts "\nRound #{round_number}:"
	move1 = player1.play
	move2 = player2.play
	puts "Player 1 chose #{move1.name}"
	puts "Player 2 chose #{move2.name}"
	result, outcome = move1.compare_to(move2)
	puts "#{result}"

	# Record the last moves if needed
	player1.record_opponent_move(move2) if player1.respond_to?(:record_opponent_move)
	player2.record_opponent_move(move1) if player2.respond_to?(:record_opponent_move)

	if outcome == 'Lose'
		puts "Player 2 won the round"
	elsif outcome == 'Win'
		puts "Player 1 won the round"
	else
		puts "Round was a tie"
	end
	outcome
end
  
# Method to play the game for a specified number of rounds
def game(rounds)
	welcome_message
	puts "\nPlease choose two players:"
	puts "(1) StupidBot"
	puts "(2) RandomBot"
	puts "(3) IterativeBot"
	puts "(4) LastPlayBot"
	puts "(5) Human"


	player1 = nil
	player2 = nil
  
	until player1 && player2
	  	print "Select player 1: "
		player1 = select_player()
		print "Select player 2: "
		player2 = select_player()
  
		if player1.nil? || player2.nil?
			puts "Invalid choice(s) - start over"
		else
			puts "#{player1.name} vs. #{player2.name}"
		end
	end


	score_player1 = 0
	score_player2 = 0
	
	rounds.times do |round|
		result = play_round(player1, player2, round + 1)
		score_player1 += 1 if result == 'Win'
		score_player2 += 1 if result == 'Lose'
	end
	
	puts "\nFinal score is #{score_player1} to #{score_player2}"
	if score_player1 == score_player2
	  	puts "Game was a draw"
	elsif score_player1 > score_player2
	  	puts "Player 1 wins"
	else
	  	puts "Player 2 wins"
	end
end


# Main Program (should be last)
n_rounds = 5
# call to kick off the game
game(n_rounds)
