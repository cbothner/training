module OfficeHoursHelper
  require 'time'

  # The OFFICE_HOURS constant is used as follows
  # - `weekday` is a capitalized name of the day of the week a given volunteer's
  #   office hours are held.
  # - `start` is the time of day the period starts.  Office hours are assumed to be
  #   one hour in length.  This value can be any reasonable time format: 1:00PM,
  #   13h, 1p, 16:30:00, etc.
  # - `staffer` is the name of the WCBN member who will be in the office.  This
  #   name is only included in the linewise display of office hours, but is
  #   included to humanize the situation, and foster a sense of community.
  # The hours will be displayed in the order they are given below: sort them by day
  # of the week.
  OFFICE_HOURS = [
    {weekday: "Monday", start: "5PM", staffer: "Max"},
    {weekday: "Wednesday", start: "3PM", staffer: "Kirsten"},
    {weekday: "Wednesday", start: "7PM", staffer: "Karl"},
    {weekday: "Thursday", start: "1PM", staffer: "Cameron"},
    {weekday: "Friday", start: "2PM", staffer: "Kristin"},
  ]

  def linewise_office_hours
    OFFICE_HOURS.map do |h|
      " - #{h[:weekday]}s from #{oh_start(h).strftime "%I:%M"} to "+
        "#{oh_end(h).strftime "%I:%M%p"} with #{h[:staffer]}"
    end*"\n"
  end

  def short_office_hours
    OFFICE_HOURS.map do |h|
      "#{h[:weekday][0..2]} #{oh_start(h).strftime "%I:%M"}--"+
        "#{oh_end(h).strftime "%I:%M%p"}"
    end*", "
  end

  def oh_start(h)
    Time.parse(h[:start])
  end
  def oh_end(h)
    oh_start(h) + 3600
  end
end
