require 'test_helper'

class EventFlowTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
    @user = users(:one)
  end

  test "can see the welcome page" do
    get root_url
    assert_select "h1", "Events"
  end

  test "can create an event" do
    get new_event_url
    assert_response :success

    post events_url, params: { event: { description: @event.description, end_date: @event.end_date,
                                        max_students: @event.max_students, name: @event.name,
                                        start_date: @event.start_date } }
    assert_response :redirect
    follow_redirect!

    assert_response :success
    assert_select "p"
  end

  test "can register a user in an event" do
    get root_url
    assert_select "h1", "Events"

    get registry_to_event_url(@event)
    assert_select "h1", "Register to #{@event.name}"

    post register_to_event_url(@event.id), params: { user: { email: @user.email } }
    assert_response :redirect
    follow_redirect!

    assert_response :success
    assert_select "p", "#{@user.email} registered to event '#{@event.name}'"
    assert_select "div", @user.email
  end

  test "can not register a user in an event" do
    get root_url
    assert_select "h1", "Events"

    get registry_to_event_url(@event)
    assert_select "h1", "Register to #{@event.name}"

    post register_to_event_url(@event.id), params: { user: { email: '' } }
    assert_select "li", "Email can't be blank"
  end

end
