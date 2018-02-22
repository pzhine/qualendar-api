require 'test_helper'

ONE_HOUR = JSON.parse JSON.generate({
  id: 1,
  title: 'Lunch with Bob',
  location: 'La Esquina',
  duration: 1.0,
  isAllDay: false,
  startsAt: 1521676800000
})

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get events" do
     get '/events/2018/3.json'
     assert_response :success
     events = JSON.parse @response.body
     assert_equal 2, events.length
     assert_equal ::ONE_HOUR, events[0]
   end

   test "should create an event" do
     event = {
       title: 'Dentist appointment',
       location: 'The dentist',
       duration: 1,
       isAllDay: false,
       startsAt: 1521673200000
     }
     post '/events.json', event
     assert_response :success
     event_id = (JSON.parse @response.body)['id']
     assert_equal 'Dentist appointment', (Event.find event_id).title
   end
end
