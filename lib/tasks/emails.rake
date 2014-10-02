namespace :emails do
  EMAILS = [
    #{message: :year, subject: "Happy Mic Day! It's been a year since you joined WCBN!",
      #days_after: 365},
    {message: :three, subject: "Three months since you first dropped by WCBN: what's up?",
      days_after: 90},
    {message: :month, subject: "How was your first month with WCBN?", days_after: 30},
    {message: :welcome, subject: "Welcome to WCBN! Step-by-step to 'On Air!'", days_after: 4},
  ]
  desc "Send emails to trainees who need them. This task should be run once daily."
  task send: :environment do
    # This constant defines which emails will be sent at which intervals.
    # - The message must be a :symbol that corresponds to one or more templates in 
    #   app/views/trainee_mailer.
    # - The subject will form the subject of the email.
    # - The intervals represent the number of days after their initial sign-up.
    # Sort the intervals longest to smallest to reduce double mailings in case cron fails
    # to run and we have a backlog.
    EMAILS.each do |i|
      Trainee.to_contact( i[:days_after] ).each do |t|
        TraineeMailer.scheduled( t, i ).deliver
        t.most_recent_email = i[:days_after]
        t.save
      end
    end
  end

  desc "Send one of each email to Cameron for testing."
  task test: :environment do
    t = Trainee.new
    t.email = "cbothner@umich.edu"
    t.name = "Cameron Bothner"
    EMAILS.each do |i|
      TraineeMailer.scheduled( t, i ).deliver
    end
  end
end
