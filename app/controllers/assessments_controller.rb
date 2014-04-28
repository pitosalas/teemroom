class AssessmentsController < ApplicationController
	def form
    team_members = get_team_members
    redirect_to(pages_path("login_first")) unless logged_in? && current_user.id == params[:user].to_i
    redirect_to(pages_path("not_ready_yet")) if team_members.nil?    
    create_assessment_page
	end

  def submit
    redirect_if_not_logged_in
    redirect_if_cancelled (params[:commit])
    team = current_user.team
    team.members.each do |m|
      ass = Assessment.find_or_create_by!(assessor: current_user, assessee: m)
      ass.assessment = params.fetch("user-#{m.id}")
      ass.save!
    end
    redirect_if_done (params[:commit])
    rerender_if_save (params[:commit])
  end

  private

  def rerender_if_save(command)
    if command == "Save"
      create_assessment_page
      render :form
      return
    end
  end


  def redirect_if_not_logged_in
    unless logged_in? && current_user.id == params[:user].to_i
      redirect_to(pages_path("login_first"))
      return
    end
  end

  def redirect_if_cancelled(command)
    if command == "Cancel"
      redirect_to(pages_path("cancel"))
      return
    end
  end

  def redirect_if_done(command)
    if command == "Done"
      redirect_to(pages_path("thank_you"))
      return
    end
  end


  def get_team_members
    team = current_user.team
    team_members = team.members.select { |m| m != current_user } unless team.nil?
    team_members
  end

  def create_assessment_page
    team_members = get_team_members
    assessments = Assessment.where(assessor: current_user)
    @assessment_page = AssessmentPage.new(current_user, team_members, assessments)
  end

end
