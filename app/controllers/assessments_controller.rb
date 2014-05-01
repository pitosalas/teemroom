class AssessmentsController < ApplicationController
  
  #  Form display rules:
  # if not logged in, or logged in user does not match url, redirect to "login first"
  # if user not on a team, or there are no other team members, redirect to "not ready yet"
  # if team is not in "post_assessment_mode", redirect to "not assessing yet"
	def form
    team = current_user.team if logged_in?
    team_members = get_team_members(team)
    check_form_preconditions(team, team_members) and return
    create_assessment_page team, team_members
	end

  # Form submission rules, before saving:
  # If not logged in, redirect to "login first"
  # if cancel form button, redirect to ""cancel"
  # and after saving:
  # if done form button, redirect to "thank you"
  # if save form button, re-reneder "form" template
  def submit
    redirect_to_if("login_first", (!logged_in? || current_user.id != params[:user].to_i)) and return
    redirect_to_if("cancel", (params[:commit] == "Cancel")) and return
    team = current_user.team
    team.members.each do |m|
      ass = Assessment.find_or_create_by!(assessor: current_user, assessee: m)
      ass.assessment = params.fetch("user-#{m.id}")
      ass.save!
    end
    redirect_to_if("cancel", (params[:commit] == "Cancel")) and return
    redirect_to_if("thank_you", (params[:commit] == "Done")) and return
    if params[:commit] == "Save"
      create_assessment_page team, get_team_members(team)
      render :form
      return
    end
  end

  private

  def check_form_preconditions team, team_members
    redirect_to(pages_path("login_first")) and return true unless logged_in? && current_user.id == params[:user].to_i
    redirect_to(pages_path("not_ready_yet")) and return true if team_members.nil?
    redirect_to(pages_path("not_assessing_yet")) and return true unless team.post_assessments_mode?
    return false    
  end

  def redirect_to_if(red_page, predicate)
    if predicate
      redirect_to(pages_path(red_page))
      return true
    else
      false
    end
  end

  def get_team_members team
    team.members.select { |m| m != current_user } unless team.nil?
  end

  def create_assessment_page team, team_members
    assessments = Assessment.where(assessor: current_user)
    @assessment_page = AssessmentPage.new(current_user, team_members, assessments)
  end

end
