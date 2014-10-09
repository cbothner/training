class TraineeMailer < ActionMailer::Base
  default from: "WCBN Training Bot <wcbntrainingbot@gmail.com>"
  add_template_helper OfficeHoursHelper

  def scheduled trainee, i
    # trainee is a Trainee
    # i is a hash {message: :template, subject: "", days_after: int}
    @trainee = trainee
    mail( to: @trainee.email, 
          subject: i[:subject],
          template_name: i[:message].to_s
    )
  end
end
