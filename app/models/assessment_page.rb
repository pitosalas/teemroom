class AssessmentPage

	class AssessmentValue

		def initialize user
			@user = user
		end

		def name
			@user.name
		end

		def id
			"user-#{@user.id}"
		end

		def options
	    [['Top contributor', "5"],
	     ['Great contributor', "4"],
	     ["Helpful", 4],
	     ["Didn't help, didn't hurt", "3"],
	     ['Net negative', "2"],
	     ['Disruptive', "1"]
	    ]
		end
	end

	def initialize principal, team
		@principal = principal
		@team = team
	end

	def principal
		@principal
	end

	def team_unspecified?
		@team.nil?
	end

	def team_name
		@principal.team.name unless team_unspecified?
	end

	def peers_av
		@team.map { |m| AssessmentValue.new (m)}
	end

	def principal_av
		AssessmentValue.new(@principal)
	end
end
