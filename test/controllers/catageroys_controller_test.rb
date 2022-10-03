require "test_helper"

class CatageroysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @catageroy = catageroys(:one)
  end

  test "should get index" do
    get catageroys_url
    assert_response :success
  end

  test "should get new" do
    get new_catageroy_url
    assert_response :success
  end

  test "should create catageroy" do
    assert_difference("Catageroy.count") do
      post catageroys_url, params: { catageroy: { name: @catageroy.name } }
    end

    assert_redirected_to catageroy_url(Catageroy.last)
  end

  test "should show catageroy" do
    get catageroy_url(@catageroy)
    assert_response :success
  end

  test "should get edit" do
    get edit_catageroy_url(@catageroy)
    assert_response :success
  end

  test "should update catageroy" do
    patch catageroy_url(@catageroy), params: { catageroy: { name: @catageroy.name } }
    assert_redirected_to catageroy_url(@catageroy)
  end

  test "should destroy catageroy" do
    assert_difference("Catageroy.count", -1) do
      delete catageroy_url(@catageroy)
    end

    assert_redirected_to catageroys_url
  end
end
