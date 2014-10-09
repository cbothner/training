# Training Database Configuration

## Change what emails are sent when.
The file `lib/tasks/emails.rake` defines what emails are sent at what intervals after enrollment.  
This is also where the emails subjects are specified.  `emails.rake` defines a constant EMAILS, 
which is a list of hashes, each containing the details of one email.  The following is an example 
configuration which sends one email on the day after the trainee enrolls.

    EMAILS = [
      {message: :welcome, subject: "Welcome to WCBN! Step-by-step to \"On Air!\"", days_after: 1},
    ]

 - `message` must be a :symbol that corresponds to a template in `app/views/trainee_mailer/`. For 
   this example, there would be a file called `app/views/trainee_mailer/welcome.text.erb` which 
   specifies the content of the message.
 - `subject` will be the subject of the email.  Surround it in double quotes, and escape internal 
   quotation marks with a backslash.
 - `days_after` represents the number of days after their initial sign-up.

Sort the intervals longest to smallest to reduce double mailings in case cron fails to run and we
have a backlog.

Note that each line ends in a comma.

## Change the text of the emails.
The email bodies are generated from templates stored in `app/views/trainee_mailer/`; edit those 
files to change the text of the emails.  The templates are ruby-embedded text or html, whose names 
correspond to the symbols in the EMAILS list in `emails.rake` with suffixes of `.text.erb` for 
plaintext emails or `.html.erb` for html emails.  If there is one html template and one plaintext 
template for a given email, they will send together as a multiformat email.

Email templates can incorporate partials, snippets used multiple times across many emails, like 
`_sig.text.erb` which contains the WCBN Training signature.  These partials are incorporated into 
the email template like this:
    <%=render 'sig' %>
In fact, any ruby code can be evaluated within the <%= %> brackets: functions defined in 
`app/helpers/office_hours_helper.rb` are accessable in the email templates, such as 
`linewise_office_hours` and `short_office_hours`, which generate lists of our office hours separated 
on on different lines, or compressed forms separated by commas.

## Change the office hours.
The file `app/helpers/office_hours_helper.rb` defines a constant `OFFICE_HOURS`, a list of hashes as 
follows:
    OFFICE_HOURS = [
      {weekday: "Thursday", start: "1PM", staffer: "Cameron"},
    ]
 - `weekday` is a capitalized name of the day of the week a given volunteer's office hours are held.
 - `start` is the time of day the period starts.  Office hours are assumed to be one hour in length.  
   This value can be any reasonable time format: 1:00PM, 13h, 1p, 16:30:00, etc.
 - `staffer` is the name of the WCBN member who will be in the office.  This name is only included 
   in the linewise display of office hours, but is included to humanize the situation, and foster a 
   sense of community.
