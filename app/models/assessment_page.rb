class AssessmentPage

	class AssessmentValue

		def initialize  name="Random User"
			@name = name
		end

		def name
			@name
		end

		def id
			("nm"+name).parameterize
		end

		def options
	    [['Awesome', "A"], 
	     ['Sucky', "F"]
	    ]
		end
	end

	def initialize principal, team
		@principal = principal
		@team_name = team
	end

	def team_unspecified?
		@team_name.nil?
	end

	def team_name
		@team.name unless team_unspecified
	end

	def peers
		[AssessmentValue.new, AssessmentValue.new]
	end

	def principal
		AssessmentValue.new(@principal)
	end
end
