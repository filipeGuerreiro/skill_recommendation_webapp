# Users
30.times do |n|
  name = Faker::StarTrek.unique.character
  User.create!(name: name)
end

# Skills
User.find_each do |user|
  i = 0
  15.times do
    name = Faker::Job.key_skill + (i += 1).to_s
    Skill.create!(user_id: user.id, name: name)
  end
  Faker::Job.unique.clear
end

# Recommendations
User.find_each do |user|
    User.all.sample(8).each do |other|
		if other != user
			skill = other.skills.sample(1).first
			suppress(Exception) do
				other.add_recommendation(user, skill)
			end
		end
	end
end