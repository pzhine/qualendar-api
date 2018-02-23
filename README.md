Qualendar API
=============

Rails back end for [Qualendar](https://github.com/pzhine/qualendar)
to provide basic persistence of calendar events.

Getting Started
---------------
1. Install the dependencies:
```
bundle install
```

2. Edit `/config/database.yml` to match your preferred database configuration.
By default, it is configured to connect via TCP to a Postgresql instance running
on localhost:5432

3. Provision the database:
```
rake db:create db:migrate db:seed
```

4. Test your configuration
```
rake test
```

5. Run the development server (http://localhost:3000)
```
rails server
```

Documentation
-------------

### Event
An event has the following JSON shape:
```
{
  "id": 101,
  "title": "Lunch with Bob",
  "location": "La Esquina",
  "duration": 60.0,
  "isAllDay": false,
  "startsAt": 1521676800000
}
```
Note:
- `startsAt` is in milliseconds since Unix epoch
- `duration` is in minutes, unless `isAllDay` is true, in which case it is in days

#### `/events/{year}/{month}`
Verbs: GET

Gets all events that start within a specified year and month.

Example: get all events that start in Feb 2018
```
GET /events/2018/2
```

#### `/events`
Verbs: POST, PUT, DELETE

Standard RESTful endpoints for manipulating Events. See [events_controller_test.rb](blob/master/test/controllers/events_controller_test.rb) for examples.
