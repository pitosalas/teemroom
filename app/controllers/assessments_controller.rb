class AssessmentsController < ApplicationController
	def form
    redirect_to(pages_path("login_first")) unless logged_in? && current_user.id == params[:user].to_i
    team = current_user.team
    team_members = team.members.select { |m| m != current_user } unless team.nil?
    assessments = Assessment.where(assessor: current_user)
		@assessment_page = AssessmentPage.new(current_user, team_members, assessments)
	end

  def submit
    commit = params[:commit]
    unless logged_in? && current_user.id == params[:user].to_i
      redirect_to(pages_path("login_first"))
      return
    end
    if commit == "Cancel"
      redirect_to(pages_path("cancel"))
      return
    end
    team = current_user.team
    team.members.each do |m|
      ass = Assessment.find_or_create_by!(assessor: current_user, assessee: m)
      ass.assessment = params.fetch("user-#{m.id}")
      ass.save!
    end
    if commit == "Done"
      redirect_to(pages_path("thank_you"))
    else
      render :form
    end
  end
end
