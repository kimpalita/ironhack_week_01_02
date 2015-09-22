

class SubjectFilter
	def initialize(subjects_to_filter)
		@subjects_to_filter = subjects_to_filter
	end

	def filter_subjects(*keywords)
		true
	end
end