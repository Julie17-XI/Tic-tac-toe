class ComputerPlayer
attr_reader :mark_value
    def initialize(mark_value)
        @mark_value=mark_value
    end

    def get_position(legal_positions)
        n=legal_positions.length
        i=rand(0..n-1)
        puts "Computer #{@mark_value} chose position #{legal_positions[i]}"
        return legal_positions[i]
    end
end