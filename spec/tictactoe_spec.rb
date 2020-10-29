# spec/tictactoe_spec.rb

# to run: bundle exec rspec

require "tictactoe"

describe TicTacToe do
	describe Player do
    context "#initialize" do
			it "gives error when empty" do
				expect { Player.new({}) }.to raise_error
      end
    end
	end
end

# describe Player do
# 	context "#initialize" do

# 		it "raises an exception when initialized with {}" do
# 			expect { Player.new({}) }.to raise_error
# 		end

# 	end
# end