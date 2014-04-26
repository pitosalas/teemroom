class Team < ActiveRecord::Base
	has_many :members, class: User
end
