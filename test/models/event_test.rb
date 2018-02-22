require 'test_helper'
require 'date'

class EventTest < ActiveSupport::TestCase
  test "should not save event without title" do
    event = Event.new(
      starts_at: DateTime.now,
      duration: 1,
      all_day: false
    )
    assert_not event.save
  end
  test "should not save event without starts_at" do
    event = Event.new(
      title: 'test event',
      duration: 1,
      all_day: false
    )
    assert_not event.save
  end
  test "should not save event without duration" do
    event = Event.new(
      title: 'test event',
      starts_at: DateTime.now,
      all_day: false
    )
    assert_not event.save
  end
  test "should not save event without all_day" do
    event = Event.new(
      title: 'test event',
      starts_at: DateTime.now,
      duration: 1,
    )
    assert_not event.save
  end
  test "should save event if valid" do
    event = Event.new(
      title: 'test event',
      starts_at: DateTime.now,
      duration: 1,
      all_day: false
    )
    assert event.save
  end
  test "should not save event if starts_at is not DateTime" do
    event = Event.new(
      title: 'test event',
      starts_at: 'foo',
      duration: 1,
      all_day: false
    )
    assert_not event.save
  end
  test "should not save event if duration is not a number" do
    event = Event.new(
      title: 'test event',
      starts_at: DateTime.now,
      duration: 'not a number',
      all_day: false
    )
    assert_not event.save
  end
end
