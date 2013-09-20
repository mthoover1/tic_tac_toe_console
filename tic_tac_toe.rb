# require_relative 'Gemfile'
require 'tic_tac_toe'

interface = Interface.new
game = GameController.new(interface)

game.play
