class UserStats
  def initialize(user)
    @user = user
    @team = user.team
  end

  def team_name
    @user.team_name
  end

  def user_name
    @user.name
  end

  def project_name
    @user.project_name
  end

  def on_team?
    !@user.team.nil?
  end

  def team_peers
    @user.team.members - [@user]
  end

  def assessment_received_from peer
    ratings = @user.received_assessments.where(assessor: peer)
    ratings.length == 1 && !ratings[0].assessment.nil? ? ratings[0].assessment : "none yet"
  end

  def assessment_given_to peer
    ratings = @user.given_assessments.where(assessee: peer)
    ratings.length == 1 && !ratings[0].assessment.nil? ? ratings[0].assessment : "none yet"
  end

  def average_assessment_given
    avg = @user.given_assessments.average(:assessment)
    avg.nil? ? "n/a" : avg
  end

  def average_assessment_received
    avg = @user.received_assessments.where.not(assessor: @user).average(:assessment)
    avg.nil? ? "n/a" : avg
  end
end