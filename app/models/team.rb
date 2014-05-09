class Team < ActiveRecord::Base
	has_many :members, class: User

  def mode_map
    { test: 0, 
     closed: 1, 
     self_assessments: 2, 
     team_formation: 3, 
     project_work: 4, 
     post_assessments: 5
   }
 end

  def mode?(mode_to_check)
    mode_map.fetch(mode_to_check) == mode
  end

  def members_count
    members.count
  end
end
