# element.rb

class Element
    attr_accessor :name
  
    def initialize(name)
      @name = name
    end
  
    def compare_to(other_element)
      fail "This method should be overridden"
    end
  end
  
  class Rock < Element
    def compare_to(other_element)
      case other_element.name
      when "Rock"
        ["Rock equals Rock", "Tie"]
      when "Paper"
        ["Paper covers Rock", "Lose"]
      when "Scissors"
        ["Rock crushes Scissors", "Win"]
      when "Lizard"
        ["Rock crushes Lizard", "Win"]
      when "Spock"
        ["Spock vaporizes Rock", "Lose"]
      else
        fail "Invalid element"
      end
    end
  end
  
  class Paper < Element
    def compare_to(other_element)
      case other_element.name
      when "Rock"
        ["Paper covers Rock", "Win"]
      when "Paper"
        ["Paper equals Paper", "Tie"]
      when "Scissors"
        ["Scissors cut Paper", "Lose"]
      when "Lizard"
        ["Lizard eats Paper", "Lose"]
      when "Spock"
        ["Paper disproves Spock", "Win"]
      else
        fail "Invalid element"
      end
    end
  end
  
  class Scissors < Element
    def compare_to(other_element)
      case other_element.name
      when "Rock"
        ["Rock crushes Scissors", "Lose"]
      when "Paper"
        ["Scissors cut Paper", "Win"]
      when "Scissors"
        ["Scissors equals Scissors", "Tie"]
      when "Lizard"
        ["Scissors decapitate Lizard", "Win"]
      when "Spock"
        ["Spock smashes Scissors", "Lose"]
      else
        fail "Invalid element"
      end
    end
  end
  
  class Lizard < Element
    def compare_to(other_element)
      case other_element.name
      when "Rock"
        ["Rock crushes Lizard", "Lose"]
      when "Paper"
        ["Lizard eats Paper", "Win"]
      when "Scissors"
        ["Scissors decapitate Lizard", "Lose"]
      when "Lizard"
        ["Lizard equals Lizard", "Tie"]
      when "Spock"
        ["Lizard poisons Spock", "Win"]
      else
        fail "Invalid element"
      end
    end
  end
  
  class Spock < Element
    def compare_to(other_element)
      case other_element.name
      when "Rock"
        ["Spock vaporizes Rock", "Win"]
      when "Paper"
        ["Paper disproves Spock", "Lose"]
      when "Scissors"
        ["Spock smashes Scissors", "Win"]
      when "Lizard"
        ["Lizard poisons Spock", "Lose"]
      when "Spock"
        ["Spock equals Spock", "Tie"]
      else
        fail "Invalid element"
      end
    end
  end
  
  # Creating instances of each element
  rock = Rock.new("Rock")
  paper = Paper.new("Paper")
  scissors = Scissors.new("Scissors")
  lizard = Lizard.new("Lizard")
  spock = Spock.new("Spock")
  
  # Storing the instances in a global list
  $moves = [rock, paper, scissors, lizard, spock]
  