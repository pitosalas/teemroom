class AssessmentsController < ApplicationController
	def assess
		redirect_to(root_path) unless logged_in?
		@assessment_page = AssessmentPage.new(current_user.name, current_user.team)
	end

	def submit_assessments
	end
	
end	
