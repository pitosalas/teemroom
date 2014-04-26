class AssessmentsController < ApplicationController
	def form
    redirect_to(root_path) unless logged_in? && current_user.id == params[:user].to_i
    @id = params[:id]
    team = current_user.team
    team_members = team.members.select { |m| m != current_user } unless team.nil?
		@assessment_page = AssessmentPage.new(current_user, team_members)
	end

	def submit
    binding.pry
  #    "✓",
  # "authenticity_token" => "pvDh9YNfZkMGFjYH9Wlbl9mj4DVCUMSk4ErXDOsBI5c=",
  #             "user-4" => "5",
  #             "user-1" => "4",
  #             "user-2" => "3",
  #             "user-3" => "",
  #             "commit" => "Submit",
  #         "controller" => "assessments",
  #             "action" => "submit",
  #               "user" => "4"
	end
	
end
