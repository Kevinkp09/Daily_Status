class AdminMailer < ApplicationMailer
  def check_in(user)
    @user = user
    mail(to: "kevinpatel907.kp@gmail.com", subject: "Employee just checked in")
  end

  def check_out(user)
    @user = user
    mail(to: "kevinpatel907.kp@gmail.com", subject: "Employee just checked out")
  end

  def new_status(user, status)
    @user = user
    @status = status
    mail(to: 'kevinpatel907.kp@gmail.com', subject: 'New Status Added has been added')
  end
end
