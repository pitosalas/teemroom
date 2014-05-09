module UsersHelper
  def user_row_class(user)
    if user.team.nil?
      "text-muted"
    elsif user.assessments_complete?
      "text-success"
    elsif !user.assessments_complete?
      "text-danger"
    end
  end

  def user_row_icon(user)
    if user.team.nil?
      ""
    elsif user.assessments_complete?
      "glyphicon glyphicon-ok"
    elsif !user.assessments_complete?
      "glyphicon glyphicon-warning-sign"
    end
  end
end
