class Team < ActiveRecord::Base
	has_many :members, class: User
  enum mode: { test: 0, closed: 1, open: 2}
end
