class Board 
    def initialize(n)
        @grid=Array.new(n){Array.new(n,"_")}
        @n=n
    end

    def valid?(position)
        ((0...@n).include?(position.first)) && ((0...@n).include?(position.last))
    end

    def empty?(position)
        @grid[position.first][position.last]=="_"
    end

    def place_mark(position,mark)
       if self.valid?(position) && self.empty?(position)
          @grid[position.first][position.last]=mark
       else
        raise "not valid position!"
       end
    end    

    def print
        @grid.each do |sub_arr|
            puts sub_arr.join(" ")
        end   
    end

    def win_row?(mark)
        @grid.any? do |sub_arr|
            sub_arr.all?(mark)
        end
    end

    def win_col?(mark)
        @grid.transpose.any? do |sub_arr|
            sub_arr.all?(mark)
        end
    end

    def win_diagonal?(mark)
        (0...@grid.length).all? {|i| @grid[i][i] == mark} || (0...@grid.length).all? {|i| @grid[i][-i - 1] == mark}
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.include?("_")
    end

    def legal_positions
       @legal_positions=[]
       (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                position=[row,col]
                @legal_positions<<position if self.valid?(position) && self.empty?(position)
            end
        end
        @legal_positions
    end

    

end
