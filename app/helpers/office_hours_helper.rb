module OfficeHoursHelper
  require 'time'

  OFFICE_HOURS = [
    {weekday: "Thursday", start: "1PM", staffer: "Cameron"},
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
