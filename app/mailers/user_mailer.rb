class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url  = "https://beatboxer-collection.onrender.com/users/#{user.activation_token}/activate"
    mail(to: user.email, subject: "ようこそ、Beatbox Hubへ！")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user
    @url  = "https://beatboxer-collection.onrender.com/login"
    mail(to: user.email, subject: "アカウントが作成されました！")
  end
end
