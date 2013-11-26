class UserMailer < ActionMailer::Base
  default from: "from@example.com"
     def get_user_mail(user)
       @user = user
       mail(to: @user.email, subject: "test email")
     end
  def send_mailer(user)
    get_user_mail(user)
  end

  def update_mailer(user)
    get_user_mail(user)
  end

  def destroy_mailer(user)
    get_user_mail(user)
  end
end
