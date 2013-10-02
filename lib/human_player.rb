class HumanPlayer
	attr_reader :board, :symbol

	def initialize(board, symbol = "X", interface)
		@board = board
		@symbol = symbol
		@interface = interface
	end

	def get_move
		move = 0
		until @board.tile_open?(move)
			puts @interface.prompt_human
			move = @interface.get_input
		end
		move
	end
end
