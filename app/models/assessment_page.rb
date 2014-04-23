class AssessmentPage

	class AssessmentValue

		def initialize  name="Pito Salas"
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

	def peers
		[AssessmentValue.new, AssessmentValue.new]
	end

	def principal
		AssessmentValue.new("Principal")
	end
end
