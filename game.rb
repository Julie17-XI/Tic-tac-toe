require_relative './board.rb'
require_relative './human_player.rb'
require_relative './computer_player.rb'
class Game
    attr_reader :players, :current_player, :board
    def initialize(n, player_marks_hash)
        @players=[]
        player_marks_hash.each do |k,v|
            if v==true
                player=ComputerPlayer.new(k)
            else
                player=HumanPlayer.new(k)
            end
            @players<<player
        end
        @current_player=@players[0]
        @board=Board.new(n)
    end

    def switch_turn
        @players.rotate!(1)
        @current_player=@players[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            puts "#{@current_player.mark_value}, your turn!"
            current_position=@current_player.get_position(@board.legal_positions)
            current_mark=@current_player.mark_value
            @board.place_mark(current_position,current_mark)
            if @board.win?(current_mark)
                puts "#{@current_player}, you won!"
                return true
            else
                self.switch_turn
            end
        end
            puts "draw!"
    end
end

