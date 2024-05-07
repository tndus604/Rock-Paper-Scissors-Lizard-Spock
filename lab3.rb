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
  def select_player(player_number)
	puts "Please choose Player #{player_number}:"
	puts "(1) StupidBot"
	puts "(2) RandomBot"
	puts "(3) IterativeBot"
	puts "(4) LastPlayBot"
	puts "(5) Human"
	print "Select player #{player_number}: "
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
	  puts "Invalid choice - start over"
	  select_player(player_number)
	end
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
	puts "Player #{outcome == 'Tie' ? '1 and 2' : outcome} #{outcome == 'Tie' ? 'both' : 'won'} the round"
	outcome
  end
  
  # Method to play the game for a specified number of rounds
  def game(rounds)
	welcome_message
	player1 = select_player(1)
	player2 = select_player(2)
	
	score_player1 = 0
	score_player2 = 0
	
	rounds.times do |round|
	  puts "\nRound #{round + 1}:"
	  puts ""
	  result = play_round(player1, player2, round + 1)
	  score_player1 += 1 if result == 'Win'
	  score_player2 += 1 if result == 'Lose'
	end
	
	puts "\nFinal score is #{score_player1} to #{score_player2}"
	if score_player1 == score_player2
	  puts "Game was a draw"
	elsif score_player1 > score_player2
	  puts "Player 1 won the game"
	else
	  puts "Player 2 won the game"
	end
  end


# Main Program (should be last)
n_rounds = 5
# call to kick off the game
game(n_rounds)