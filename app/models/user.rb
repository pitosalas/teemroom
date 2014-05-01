class User < ActiveRecord::Base
  belongs_to :team

  has_many :given_assessments, class_name: "Assessment", foreign_key: "assessor_id"
  has_many :received_assessments, class_name: "Assessment", foreign_key: "assessee_id"

	def self.from_omniauth(auth)
    puts "* * * #{auth.to_yaml}"
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
end
