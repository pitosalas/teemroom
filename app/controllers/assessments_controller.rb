class AssessmentsController < ApplicationController
	def form
    redirect_to(root_path) unless logged_in? && current_user.id == params[:user].to_i
    team = current_user.team
    team_members = team.members.select { |m| m != current_user } unless team.nil?
    assessments = Assessment.where(assessor: current_user)
		@assessment_page = AssessmentPage.new(current_user, team_members, assessments)
	end

	
  def submit
    binding.pry
    redirect_to(root_path) unless logged_in? && current_user.id == params[:user].to_i
    team = current_user.team
    team.members.each do |m|
      ass = Assessment.find_or_create_by!(assessor: current_user, assessee: m)
      ass.assessment = params.fetch("user-#{m.id}")
      ass.save!
    end
  end
end
