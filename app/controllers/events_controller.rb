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
end
