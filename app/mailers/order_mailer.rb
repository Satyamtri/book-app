class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_created.subject
  #
  def order_created(user)
    
    @user = user
    email = user.email
    @greeting = "Hi"
    attachments['bookmail.png'] = File.read('app/assets/images/bookmail.png')
    mail(
      from: User.first.email,
      to: email, 
      # cc: User.all.pluck(:email), 
      bcc: "secrete@bookapp.com", 
      subject: "New order created"
    )
  end
end
