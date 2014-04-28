class AssessmentPage

	class AssessmentValue
		def initialize user, default
			@user = user
			@default = default
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
	     ["Helpful", "3"],
	     ["Didn't help, didn't hurt", "2"],
	     ['Net negative', "1"],
	     ['Disruptive', "0"]
	    ]
		end

		def default
			@default
		end
	end

	def initialize principal, team, assessments
		@principal = principal
		@assessments = assessments
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
		@team.map do |member|
			peer_ass_rec = @assessments.select { |ass| ass.assessee == member }.first
			default = ass_to_default(peer_ass_rec)
			AssessmentValue.new member, default
		end
	end

	def principal_av
		prin_ass_rec = @assessments.select {|ass| ass.assessee == principal}.first
		default = ass_to_default(prin_ass_rec)
		AssessmentValue.new(@principal, default)
	end

	private
		def ass_to_default ass
			ass.assessment unless ass.nil?
		end
end
