class Event < ActiveRecord::Base
  validates :title, :starts_at, :duration, presence: true
  validates :all_day, inclusion: [true, false]
  validates :duration, numericality: true
end
