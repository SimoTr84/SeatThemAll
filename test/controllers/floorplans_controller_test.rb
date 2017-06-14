require 'test_helper'

class FloorplansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @floorplan = floorplans(:one)
  end

  test "should get index" do
    get floorplans_url
    assert_response :success
  end

  test "should get new" do
    get new_floorplan_url
    assert_response :success
  end

  test "should create floorplan" do
    assert_difference('Floorplan.count') do
      post floorplans_url, params: { floorplan: { left: @floorplan.left, restaurant_id: @floorplan.restaurant_id, top: @floorplan.top } }
    end

    assert_redirected_to floorplan_url(Floorplan.last)
  end

  test "should show floorplan" do
    get floorplan_url(@floorplan)
    assert_response :success
  end

  test "should get edit" do
    get edit_floorplan_url(@floorplan)
    assert_response :success
  end

  test "should update floorplan" do
    patch floorplan_url(@floorplan), params: { floorplan: { left: @floorplan.left, restaurant_id: @floorplan.restaurant_id, top: @floorplan.top } }
    assert_redirected_to floorplan_url(@floorplan)
  end

  test "should destroy floorplan" do
    assert_difference('Floorplan.count', -1) do
      delete floorplan_url(@floorplan)
    end

    assert_redirected_to floorplans_url
  end
end
