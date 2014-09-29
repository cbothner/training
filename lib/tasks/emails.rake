namespace :emails do
  desc "TODO"
  task send: :environment do
    # This constant defines which emails will be sent at which intervals.
    # - The message must be a :symbol that corresponds to one or more templates in 
    #   app/views/trainee_mailer.
    # - The subject will form the subject of the email.
    # - The intervals represent the number of days after their initial sign-up.
    # Sort the intervals longest to smallest to reduce double mailings in case cron fails
    # to run and we have a backlog.
    EMAILS = [
      {message: :year, subject: "Happy Mic Day! It's been a year since you joined WCBN!",
        days_after: 365}, 
      {message: :month, subject: "How are you doing after a month at WCBN?", days_after: 30}, 
      {message: :week, subject: "How was your first week with WCBN?", days_after: 7}, 
      {message: :welcome, subject: "Welcome to WCBN", days_after: 1}, 
    ]
    EMAILS.each do |i|
      Trainee.to_contact( i[:days_after] ).each do |t|
        TraineeMailer.scheduled( t, i ).deliver
        t.most_recent_email = i[:days_after]
        t.save
      end
    end
  end
end
