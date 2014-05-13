class User < ActiveRecord::Base

  belongs_to :team

  has_many :given_assessments, class_name: "Assessment", foreign_key: "assessor_id"
  has_many :received_assessments, class_name: "Assessment", foreign_key: "assessee_id"

	def self.from_omniauth(auth)
		where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
	end

	def self.from_fakeuser(nickname)
		auth = { "provider" => "Test", "uid" => 0, "info" => {"nickname" => nickname, "name" => nickname }}
		where(nickname: nickname).first || create_from_omniauth(auth)
	end

	def self.create_from_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
			user.nickname = auth["info"]["nickname"] if auth["provider"] == "twitter"
			user.email = auth["info"]["email"] if auth["provider"] == "google_oauth2"
 		end
	end

  def admin?
    name == "Pito Salas"
  end

  def assessments_complete?
    required_assessments_count == valid_assessments_count
  end

  def valid_assessments_count
    valid_assessments.count
  end

  def valid_assessments
    given_assessments.where("assessments.assessment IS NOT NULL")
  end

  def valid_received_assessments
    Assessment.where("assessments.assessment IS NOT NULL", assessee: self)
  end

  def non_self_received_assessments
    valid_received_assessments.where.not(assessee: self)
  end


  def required_assessments_count
    team ? team.members_count : "n/a"
  end

  def self_assessment?
    self_assessment.length != 0
  end

  def self_assessment
    valid_assessments.where(assessee: self)
  end

  def non_self_assessments
    valid_assessments.where.not(assessee: self)
  end

  def stats
    if assessments_complete?
      "self: #{self_assessment.average(:assessment)}, team: #{non_self_received_assessments.average(:assessment)}"
    end
  end

  def team_name
    team ? team.name : "Not on a team"
  end

  def project_name
    team ? team.project_name : "No project"
  end


end
