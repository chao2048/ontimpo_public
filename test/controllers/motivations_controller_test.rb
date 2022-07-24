require "test_helper"

class MotivationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @motivation = motivations(:one)
  end

  test "should get index" do
    get motivations_url
    assert_response :success
  end

  test "should get new" do
    get new_motivation_url
    assert_response :success
  end

  test "should create motivation" do
    assert_difference("Motivation.count") do
      post motivations_url, params: { motivation: { goal: @motivation.goal, reward: @motivation.reward } }
    end

    assert_redirected_to motivation_url(Motivation.last)
  end

  test "should show motivation" do
    get motivation_url(@motivation)
    assert_response :success
  end

  test "should get edit" do
    get edit_motivation_url(@motivation)
    assert_response :success
  end

  test "should update motivation" do
    patch motivation_url(@motivation), params: { motivation: { goal: @motivation.goal, reward: @motivation.reward } }
    assert_redirected_to motivation_url(@motivation)
  end

  test "should destroy motivation" do
    assert_difference("Motivation.count", -1) do
      delete motivation_url(@motivation)
    end

    assert_redirected_to motivations_url
  end
end
