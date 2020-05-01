class HumanPlayer
attr_reader :mark_value
    def initialize(mark_value)
        @mark_value=mark_value
    end

    def get_position(legal_positions)
        puts "enter two numbers representing a position in the format 'row col'.'"
        user_input=gets.chomp.split(" ").map(&:to_i)
        if !legal_positions.include?(user_input)
            raise "#{user_input} is not a legal position"
        else
            return user_input
        end
    end


end