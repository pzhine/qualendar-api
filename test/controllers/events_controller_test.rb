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

   test "should update an event" do
     put '/events/2.json', {
       title: 'Dentist appointment',
       location: 'The dentist',
       duration: 2,
       isAllDay: false,
       startsAt: 1521673200000
     }
     assert_response :success
     assert_equal 2, (Event.find 2).duration
   end

   test "should return 404 if unknown event id is specified in update" do
     patch '/events/5.json', {}
     assert_response :missing
   end

   test "should delete an event" do
     delete '/events/2.json'
     assert_not Event.exists?(2)
   end

   test "should return 404 if unknown event id is specified in destroy" do
     delete '/events/5.json'
     assert_response :missing
   end
end
