namespace :shadows do
  desc "Mark shadowed = true for trainees who are due to shadow someone today"
  task mark: :environment do
    todays_shadows = Trainee.to_mark_shadowed
    todays_shadows.each do |t|
      t.shadowed = true
      t.save
    end
  end

  desc "Print out a list of trainees who would be marked shadowed = true"
  task test: :environment do
    p "The following trainees will be marked shadowed = true"
    todays_shadows = Trainee.to_mark_shadowed
    todays_shadows.each do |t|
      p "#{t.name}, to shadow today with #{t.mentor.name}"
    end
  end
end
