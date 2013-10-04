class GameController
	attr_reader :next_player, :board, :computer, :player1, :player2

	def initialize(interface, board = nil, player1 = nil, player2 = nil)
		@interface = interface
		@board = board
		@player1 = player1
		@player2 = player2
		@next_player = @player1
	end

	def play
		create_board if @board == nil
		coin_toss

		show_board

		until @board.game_over?
			Kernel.sleep(0.5) if @next_player.class == ComputerPlayer && @board.move_count > 0
			@board.update_tile(@next_player.get_move, @next_player.symbol)
			update_next_player
			show_board
		end

		puts @interface.display_results(@board, @board.symbol1, @board.symbol2)
	end

	def create_board
		puts @interface.clear_screen
		puts @interface.pick_board_size
		board_size = @interface.get_input

		@board = Board.new(board_size)
	end

	def create_computer_player
		@computer = ComputerPlayer.new(@board)
	end

	def coin_toss
		coin = ["heads","tails"].sample

		if coin == "heads"
			@player1 = HumanPlayer.new(@board, @board.symbol1, @interface)
			@player2 = ComputerPlayer.new(@board, @board.symbol2)
		else
			@player1 = ComputerPlayer.new(@board, @board.symbol1)
			@player2 = HumanPlayer.new(@board, @board.symbol2, @interface)
		end

		@next_player = @player1
	end

	def show_board
		puts @interface.clear_screen
		puts @interface.tile_number_diagram(@board.size)
		puts @board
	end

	def update_next_player
		@next_player == @player1 ? @next_player = @player2 : @next_player = @player1
	end
end
