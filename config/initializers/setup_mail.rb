ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :authentication => :plain,
    :domain => 'gmail.com',
    :user_name => ENV["EMAIL_ID"] ,
    :password => ENV["PASSWORD"]
 
}
#send email
ActionMailer::Base.default_url_options = {:host=> 'recipes-app-test.herokuapp.com'}
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
#ActionMailer::Base.raise_deliveries_errors = true
#ActionMailer::Base.default :charset=> "utf-8"
