class Board
    attr_reader :knight, :positions

    def initialize(knight_position)
        @rows = [1, 2, 3, 4, 5, 6, 7, 8]
        @columns = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
        @positions = []
        @rows.each{ |row| @columns.each{ |column| @positions << (position = (row.to_s << column.to_s)) }}
        @knight = Knight.new(knight_position)
    end

    def print_board
        column = 0
        @positions.reduce do |row, position|
            if row.class != Array
                row = [row]
            end
            if row.length == 1
                puts '  -------------------------------------'
            end
            if row.length == 7
                if position == self.knight.position
                    row.push("   ")
                else
                    row.push(position)
                end
                puts "  " + row.join(" | ")
                row = []
            else
                if position == self.knight.position
                    row.push("  ")
                else
                    row.push(position)
                end
    
            end
        end
        puts '  -------------------------------------'
    end
            

    # def knight_move(position=@knight.position, end_position)
        
    #     @knight.position
    # end


end

class Knight
    attr_accessor :position

    def initialize(position)
        @position = position
    end

end

board = Board.new("3d")
p board.positions
p board.knight.position
board.print_board
#board.knight_move(board.knight.position, [3, 3])