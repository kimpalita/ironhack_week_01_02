require_relative '../stringcalculator.rb'

RSpec.describe "String Calculator" do

	before :each do
		@calculator = Calculator.new
	end

	it "calculator takes an empty string" do
		expect(@calculator.add_string("")).to eq(0)
	end

	it "calculator adds two numbers. In this case 4 and 3 is 7." do
		expect(@calculator.add_string("4, 3")).to eq(7)
	end

	it "calculator can take one number. 8 returns 8" do
		expect(@calculator.add_string("8")).to eq(8)
	end

	it "calculator takes many numbers. 3, 6, 7, 5, and 6 is 27" do
		expect(@calculator.add_string("3,6,7,5,6")).to eq(27)
	end

	it "calculator takes numbers from different lines." do
		expect(@calculator.add_string("5\n6\n7")).to eq(18)
	end
end





=begin
	if @calculator.add_string("") != 0
		puts "something went wrong!"
	end

	if @calculator.add_string("4, 3") != 7
		puts "this place is too small for the both of us"
	end

	if @calculator.add_string("8") != 8
		puts "one number does not work"
	end

	if @calculator.add_string("3,6,7,5,6") != 27
		puts "this calculator cannot take many numbers"
	end
=end