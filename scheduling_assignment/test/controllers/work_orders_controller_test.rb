require "test_helper"

class WorkOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_order = work_orders(:one)
  end

  test "should get index" do
    get work_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_work_order_url
    assert_response :success
  end

  test "should create work_order" do
    assert_difference("WorkOrder.count") do
      post work_orders_url, params: { work_order: { duration: @work_order.duration, location_id: @work_order.location_id, price: @work_order.price, technician_id: @work_order.technician_id, time: @work_order.time } }
    end

    assert_redirected_to work_order_url(WorkOrder.last)
  end

  test "should show work_order" do
    get work_order_url(@work_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_order_url(@work_order)
    assert_response :success
  end

  test "should update work_order" do
    patch work_order_url(@work_order), params: { work_order: { duration: @work_order.duration, location_id: @work_order.location_id, price: @work_order.price, technician_id: @work_order.technician_id, time: @work_order.time } }
    assert_redirected_to work_order_url(@work_order)
  end

  test "should destroy work_order" do
    assert_difference("WorkOrder.count", -1) do
      delete work_order_url(@work_order)
    end

    assert_redirected_to work_orders_url
  end
end
