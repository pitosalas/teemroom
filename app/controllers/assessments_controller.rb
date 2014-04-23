class AssessmentsController < ApplicationController
	def assess
		@assessment_page = AssessmentPage.new
	end

	def submit_assessments
	end
end	
