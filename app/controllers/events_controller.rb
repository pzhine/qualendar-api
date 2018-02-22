require 'date'

class EventsController < ApplicationController
  def month
    start_date = Date.new(params[:year].to_i, params[:month].to_i, 1)
    end_date = Date.new(
      params[:year].to_i,
      params[:month].to_i,
      start_date.end_of_month.day
    )
    @events = Event.where(:starts_at => start_date..end_date)
  end

  def create
    event_params = params['params']['event']
    @event = Event.new({
      title: event_params['title'],
      location: event_params['location'],
      duration: event_params['duration'].to_f,
      all_day: event_params['isAllDay'],
      starts_at: Time.at(event_params['startsAt'].to_i / 1000)
    })
    @event.save
  end
end
