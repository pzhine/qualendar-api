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
    @event = Event.new(event_params params)
    @event.save
  end

  def update
    @event = Event.find params[:id]
    @event.update!(event_params params)
  end

  def destroy
    @event = Event.find params[:id]
    @event.destroy!
    render status: 200
  end

  private
    def event_params(params)
      {
        title: params['title'],
        location: params['location'],
        duration: params['duration'].to_f,
        all_day: params['isAllDay'],
        starts_at: Time.at(params['startsAt'].to_i / 1000)
      }
    end
end
