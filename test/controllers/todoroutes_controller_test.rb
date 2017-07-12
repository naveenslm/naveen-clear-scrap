require 'test_helper'

class TodoroutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todoroute = todoroutes(:one)
  end

  test "should get index" do
    get todoroutes_url
    assert_response :success
  end

  test "should get new" do
    get new_todoroute_url
    assert_response :success
  end

  test "should create todoroute" do
    assert_difference('Todoroute.count') do
      post todoroutes_url, params: { todoroute: { from: @todoroute.from, rou_id: @todoroute.rou_id, to: @todoroute.to } }
    end

    assert_redirected_to todoroute_url(Todoroute.last)
  end

  test "should show todoroute" do
    get todoroute_url(@todoroute)
    assert_response :success
  end

  test "should get edit" do
    get edit_todoroute_url(@todoroute)
    assert_response :success
  end

  test "should update todoroute" do
    patch todoroute_url(@todoroute), params: { todoroute: { from: @todoroute.from, rou_id: @todoroute.rou_id, to: @todoroute.to } }
    assert_redirected_to todoroute_url(@todoroute)
  end

  test "should destroy todoroute" do
    assert_difference('Todoroute.count', -1) do
      delete todoroute_url(@todoroute)
    end

    assert_redirected_to todoroutes_url
  end
end
