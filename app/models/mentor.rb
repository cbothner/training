class Mentor < ActiveRecord::Base
  validates :active, :name, :phone, :email, :weekday, :start, :end, presence: true
  validates :weekday, numericality: { only_integer: true,
                                      greater_than_or_equal_to: 0, 
                                      less_than_or_equal_to: 6}
  validate :end_is_after_start?

  has_many :trainees

  def self.available
    where(active: true).order(:weekday, :start).select(&:open?)
  end

  def open?
    trainees.reject(&:shadowed).empty?
  end

  def end_is_after_start?
    if self.start > self.end
      errors.add :end, "End time cannot be before start time."
    end
  end

  def to_s
    "#{name} &mdash; #{slot_string}<br \>".html_safe
  end

  def slot_string
    "#{Weekdays[weekday]} from #{start.strftime("%I:%M%p")} to #{self.end.strftime("%I:%M%p")}"
  end
end

Weekdays = {
  'Monday' => 0, 'Tuesday' => 1, 'Wednesday' => 2, 'Thursday' => 3,
  'Friday' => 4, 'Saturday' => 5, 'Sunday' => 6,
  0 => 'Monday', 1 => 'Tuesday', 2 => 'Wednesday', 3 => 'Thursday',
  4 => 'Friday', 5 => 'Saturday', 6 => 'Sunday'
}
