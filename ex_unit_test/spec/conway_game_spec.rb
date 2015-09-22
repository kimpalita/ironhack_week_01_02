require_relative '../conway_game.rb'


RSpec.describe "Survivor Class with SeedGeneration STUB" do
	
	let(:live_cell_no_neighbors) do
		instance_double("SeedGeneration", :live_state => true, :neighbors => 0)
	end

	let(:live_cell_3_neighbors) do
		instance_double("SeedGeneration", :live_state => true, :neighbors => 3)
	end

	let(:live_cell_more_than_3_neighbors) do
		instance_double("SeedGeneration", :live_state => true, :neighbors => 6)
	end

	let(:dead_cell_3_neighbors) do
		instance_double("SeedGeneration", :live_state => false, :neighbors => 3)
	end

	let(:dead_cell_2_neighbors) do
		instance_double("SeedGeneration", :live_state => false, :neighbors => 2)
	end

#------------------------------------------------

	it "cell's live state returns false in the new generation if it doesn't have neighbors" do
		expect(Survivor.new(live_cell_no_neighbors).live_or_die).to eq(false)
	end

	it "cell's live state remains true in the new generation if it had 2 or 3 neighbors" do
		expect(Survivor.new(live_cell_3_neighbors).live_or_die).to eq(true)
	end

	it "cell's live state returns false in the new generation if it has more than 3 neighbors" do
		expect(Survivor.new(live_cell_more_than_3_neighbors).live_or_die).to eq(false)
	end

	it "dead cell's live state returns true in the new generation if it has 3 neighbors" do
		expect(Survivor.new(dead_cell_3_neighbors).live_or_die).to eq(true)
	end

	it "dead cell's live state remains false in the new generation if it has 2 neighbors" do
		expect(Survivor.new(dead_cell_2_neighbors).live_or_die).to eq(false)
	end
end

#------------------------------------------------

