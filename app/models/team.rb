class Team < ActiveRecord::Base
	has_many :members, class: User
#  enum mode: 
#    { test: 0, 
#      closed: 1, 
#      self_assessments: 2, 
#      team_formation: 3, 
#      project_work: 4, 
#      post_assessments: 5

  def test_mode?
    mode == 0
  end

  def closed_mode?
    mode == 1
  end

  def self_assessments_mode?
    mode == 2
  end

  def team_formation_mode?
    mode == 3
  end

  def project_work_mode?
    mode == 4
  end

  def post_assessments_mode?
    mode == 4
  end

end
