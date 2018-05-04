require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "invalid event should not be saved" do
    event = Event.new
    refute event.save
  end

  test "valid event should be saved" do
    event = Event.new(name: 'RubySchool', start_date: DateTime.now, end_date: 6.weeks.from_now, description: 'For 5 thursdays')
    assert event.save
  end

  test "invalid event without name assigned" do
    event = Event.new(start_date: DateTime.now, end_date: 6.weeks.from_now)
    refute event.save
  end

  test "invalid event without start_date assigned" do
    event = Event.new(name: 'RubySchool', end_date: 6.weeks.from_now)
    refute event.save
  end

  test "invalid event without end_date assigned" do
    event = Event.new(name: 'RubySchool', start_date: DateTime.now)
    refute event.save
  end

  test "invalid event without description assigned" do
    event = Event.new(name: 'RubySchool', start_date: DateTime.now, end_date: 6.weeks.from_now)
    refute event.save
  end

  test "don't have to save if not have description assigned" do
    1.upto(100) do |i|
      event = events("event_#{i}")
      e = Event.new(name: event.name, start_date: event.start_date, end_date: event.end_date, description: event.description)
      if (i%2).eql?(0)
        assert e.save
      else
        refute e.save
      end
    end
  end

end
