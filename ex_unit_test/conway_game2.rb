require 'pry'

class GenerationOne
	attr_accessor :live_cells, :dead_cells, :next_gen_cells

	def initialize(seeds)
		@seeds = seeds
		#@array_of_seeds = @seeds.seed_positions
		@live_cells = []
		@dead_cells = []
		@next_gen_cells = []
	end

	def cells_states(grid)
		grid.map do |cell|
			if @seeds.include? cell
				@live_cells << cell
				else
				@dead_cells << cell
			end
		end
	end

	def sort_survivors
		#find out number of neighbors for each live cell
		@live_cells.each do |cell|
			neighbors_to_count = NeighborCounter.new(cell, @live_cells).count_neighbors
			if neighbors_to_count == 2 || neighbors_to_count == 3
				@next_gen_cells << cell
			end
		end
		
		@dead_cells.each do |cell|
			neighbors_to_count = NeighborCounter.new(cell, @live_cells).count_neighbors
			if neighbors_to_count == 3
				@next_gen_cells << cell
			end
		end
		#@next_gen_cells.push({x: 1, y: 2}, {x: 2, y: 2}, {x: 3, y: 2})
	end
end


class NeighborCounter
	attr_accessor :neighbor_count, :surrounding_live_cells

	def initialize(live_cell, all_live_cells)
		@neighbor_count = 0
		@live_cell = live_cell
		@all_live_cells = all_live_cells
		@surrounding_live_cells = @all_live_cells - [@live_cell]
	end

	def count_neighbors
		@surrounding_live_cells.each do |cell|
			if @live_cell[:x] == cell[:x] + 1 && @live_cell[:y] == cell[:y] + 1
				@neighbor_count += 1
			elsif @live_cell[:x] == cell[:x] + 1 && @live_cell[:y] == cell[:y]
			@neighbor_count += 1
			elsif @live_cell[:x] == cell[:x] + 1 && @live_cell[:y] == cell[:y] - 1
			@neighbor_count += 1
			elsif @live_cell[:x] == cell[:x] && @live_cell[:y] == cell[:y] - 1
			@neighbor_count += 1
			elsif @live_cell[:x] == cell[:x] - 1 && @live_cell[:y] == cell[:y] - 1
			@neighbor_count += 1
			elsif @live_cell[:x] == cell[:x] - 1 && @live_cell[:y] == cell[:y]
			@neighbor_count += 1
			elsif @live_cell[:x] == cell[:x] - 1 && @live_cell[:y] == cell[:y] + 1
			@neighbor_count += 1
			elsif @live_cell[:x] == cell[:x] && @live_cell[:y] == cell[:y] + 1
			@neighbor_count += 1
			end
		end
		@neighbor_count
	end
end

class GenerationSnapshots
	def initialize(timeframe)
		@timeframe = timeframe
	end

	def show_snapshots
		snaps = 0
		current_gen = GenerationOne.new([{x: 2, y: 2}, {x: 2, y: 1}, {x: 2, y: 3}])
		current_gen.cells_states([{x: 1, y: 1}, {x: 1, y: 2}, {x: 1, y: 3}, {x: 2, y: 1}, {x: 2, y: 2}, {x: 2, y: 3}, {x: 3, y: 1}, {x: 3, y: 2}, {x: 3, y: 3}])
		current_gen.sort_survivors
		
		while snaps < @timeframe
			new_gen = GenerationOne.new(current_gen.next_gen_cells)
			p current_gen.next_gen_cells
			snaps += 1
		end
	end
end

cell_history = GenerationSnapshots.new(7)
cell_history.show_snapshots





=begin
gen_one = GenerationOne.new([{x: 2, y: 2}, {x: 2, y: 1}, {x: 2, y: 3}])
gen_one.cells_states([{x: 1, y: 1}, {x: 1, y: 2}, {x: 1, y: 3}, {x: 2, y: 1}, {x: 2, y: 2}, {x: 2, y: 3}, {x: 3, y: 1}, {x: 3, y: 2}, {x: 3, y: 3}])
p gen_one.live_cells
p gen_one.dead_cells

gen_one.sort_survivors
p gen_one.next_gen_cells

puts "gen 2"

gen_two = GenerationOne.new(gen_one.next_gen_cells)
gen_two.cells_states([{x: 1, y: 1}, {x: 1, y: 2}, {x: 1, y: 3}, {x: 2, y: 1}, {x: 2, y: 2}, {x: 2, y: 3}, {x: 3, y: 1}, {x: 3, y: 2}, {x: 3, y: 3}])
p gen_two.live_cells

#my_neighbors = NeighborCounter.new({x: 2, y: 2}, [{x: 2, y: 2}, {x: 2, y: 1}, {x: 2, y: 3}])

#p my_neighbors.surrounding_live_cells

#p my_neighbors.count_neighbors
=end








