require 'tic_tac_toe'

require './lib/interface'
require './lib/human_player'
require './lib/game_controller'

interface = Interface.new
game = GameController.new(interface)

game.play
