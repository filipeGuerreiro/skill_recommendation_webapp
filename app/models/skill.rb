class Skill < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order(recommendations: :desc) }
	
	validates :name, presence: true, allow_blank: false, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
end
