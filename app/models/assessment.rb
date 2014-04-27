class Assessment < ActiveRecord::Base
  belongs_to :assessor, class_name: "User"
  belongs_to :assessee, class_name: "User"
end
