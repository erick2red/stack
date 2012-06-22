class Notifications < ActionMailer::Base
  default from: "erick.perez@cbiomed.cu"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.activate_account.subject
  #
  def activate_account user
    @user = user

    mail :to => "#{@user.name} <#{@user.email}>", :subject => t(:activate_account)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.forgot_password.subject
  #
  def forgot_password
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
