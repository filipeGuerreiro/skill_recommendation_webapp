require 'test_helper'

class RecommendationTest < ActiveSupport::TestCase

  def setup
    @recommendation = Recommendation.new(user_id: users(:michael).id,
                                         skill_id: users(:archer).skills(:archery).id)
  end

  test "should be valid" do
    assert @recommendation.valid?
  end

  test "should require a user_id" do
    @recommendation.user_id = nil
    assert_not @recommendation.valid?
  end
  
end
