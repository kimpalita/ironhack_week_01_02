class Survivor
	def initialize(last_generation_cell)
		@last_generation_cell = last_generation_cell
		@lives_on = false
	end

	def live_or_die
		if @last_generation_cell.live_state == true
			if @last_generation_cell.neighbors >= 2 && @last_generation_cell.neighbors <= 3
				@lives_on = true
			end

		elsif @last_generation_cell.live_state == false && @last_generation_cell.neighbors == 3
			@lives_on = true
		end
		@lives_on
	end
end