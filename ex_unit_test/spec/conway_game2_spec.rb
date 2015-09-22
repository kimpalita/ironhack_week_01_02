require_relative '../conway_game2.rb'
require 'pry'


RSpec.describe "" do

	before :each do
	@grid_cells = [{x: 1, y: 1}, {x: 1, y: 2}, {x: 1, y: 3}, {x: 2, y: 1}, {x: 2, y: 2}, {x: 2, y: 3}, {x: 3, y: 1}, {x: 3, y: 2}, {x: 3, y: 3}]
	end

	let(:first_seeds) do
		instance_double("Seed Generation Grid",
			:seed_positions => [{x: 2, y: 2}, {x: 2, y: 1}, {x: 2, y: 3}])
	end

	let(:gen_one){GenerationOne.new([{x: 2, y: 2}, {x: 2, y: 1}, {x: 2, y: 3}])}

	let(:gen_two){GenerationOne.new(gen_one.next_gen_cells)}

#------------------------------------------------

	it "show empty array for live cells in first generation" do
		expect(gen_one.live_cells).to match_array([])
	end

	it "show live cells in the first generation" do
		gen_one.cells_states(@grid_cells)
		expect(gen_one.live_cells).to match_array([{x: 2, y: 1}, {x: 2, y: 2}, {x: 2, y: 3}])
	end

	it "show dead cells in the first generation" do
		gen_one.cells_states(@grid_cells)
		expect(gen_one.dead_cells).to match_array([{:x=>1, :y=>1}, {:x=>1, :y=>2}, {:x=>1, :y=>3}, {:x=>3, :y=>1}, {:x=>3, :y=>2}, {:x=>3, :y=>3}])
	end

	it "show cells that will survive the next generation" do
		gen_one.cells_states(@grid_cells)
		gen_one.sort_survivors
		expect(gen_one.next_gen_cells).to match_array([{x: 1, y: 2}, {x: 2, y: 2}, {x: 3, y: 2}])
	end
	
	it "show live cells in the new generation" do
		gen_one.cells_states(@grid_cells)
		gen_one.sort_survivors
		gen_two.cells_states(@grid_cells)
		expect(gen_two.live_cells).to match_array([{x: 1, y: 2}, {x: 2, y: 2}, {x: 3, y: 2}])
	end

end