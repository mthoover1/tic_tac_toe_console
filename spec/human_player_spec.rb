require 'human_player'
require 'interface'
require 'spec_helper'

describe HumanPlayer do
  let(:board) { Board.new(3) }
  let(:interface) { Interface.new }
  let(:human) { HumanPlayer.new(board, "X", interface) }

  def make_moves(board, moves)
    SpecHelper.make_moves(board, moves)
  end

  it "should get the human's move from the human input" do
    make_moves(board, ["---",
                       "---",
                       "---"])
    interface.stub(gets: "5\n")
    human.stub(:puts)
    human.get_move.should eq(5)
  end
end
