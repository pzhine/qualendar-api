require 'date'

Event.delete_all

Event.create!([
  {
    id: 1,
    all_day: false,
    starts_at: DateTime.new(2018, 4, 10, 6, 30),
    duration: 2.75 * 60,
    title: 'Vuelo a Paris',
    location: 'Barcelona BCN'
  },
  {
    id: 2,
    all_day: true,
    starts_at: Date.new(2018, 4, 13),
    title: "Dad's birthday",
    duration: 1
  },
  {
    id: 3,
    all_day: false,
    starts_at: DateTime.new(2018, 4, 24, 11, 45),
    duration: 1.25 * 60,
    title: 'Vuelo a Londres',
    location: 'Paris CDG'
  },
  {
    id: 4,
    all_day: true,
    starts_at: Date.new(2018, 4, 24),
    duration: 3,
    title: 'Return videotapes',
    location: 'Blockbuster'
  },
  {
    id: 5,
    all_day: true,
    starts_at: Date.new(2018, 4, 15),
    duration: 1,
    title: 'Tax day'
  },
  {
    id: 6,
    all_day: true,
    starts_at: Date.new(2018, 4, 15),
    duration: 1,
    title: 'Spring cleaning'
  },
  {
    id: 7,
    all_day: false,
    starts_at: DateTime.new(2018, 4, 15, 20, 0),
    duration: 1.25 * 60,
    title: 'Party with John'
  },
  {
    id: 8,
    all_day: 'foo',
    starts_at: DateTime.new(2018, 4, 15, 20, 0),
    duration: 60,
    title: 'Call mom'
  },
  {
    id: 9,
    all_day: false,
    starts_at: DateTime.new(2018, 4, 10, 20, 0),
    duration: 8 * 60,
    title: 'Vuelo durante la noche',
    location: 'New York JFK'
  }
])
