class User < ActiveRecord::Base
	has_many :skills, dependent: :destroy
	has_many :recommendations, dependent: :destroy
	
	# Add a new skill for this user.
	def add_skill(user_id, name)
		new_skill = Skill.new(user_id, name)
		skills << new_skill
	end

	# Deletes an existing skill for this user.
	def remove_skill(skill)
		skills.delete!(skill)
	end
	
	# Add a recommendation for another user.
	def add_recommendation(user, skill)
		ActiveRecord::Base.transaction do
			skill.increment(:recommendations, 1).save
			Recommendation.create!(user_id: user.id, skill_id: skill.id)
		end
	end

	# Deletes an existing recommendation for another user.
	def remove_recommendation(recommendation)
		ActiveRecord::Base.transaction do
			Skill.find(recommendation.skill_id).decrement!(:recommendations, 1).save
			recommendations.delete!(recommendation)
		end
	end

end
