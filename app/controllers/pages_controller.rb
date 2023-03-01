class PagesController < ApplicationController
  def index
  
  end

  def otp_form

  end

  def generate_otp
    number = params[:contactnumber]
    @@message =  rand.to_s[2..5]
  
    obj = TwilioClient.new.send_text(number, @@message)
    sms=Sm.new
    sms.code=@@message
    sms.contactnumber=number
    sms.save
    @first_value = params[:contactnumber]
    session[:passed_variable] = @first_value
    redirect_to otp_verify_path

  end

  def otp_verify

  end

  def otp_verification
    @first_value = session[:passed_variable]
    user_contactnumber = @first_value
    current_otp = Sm.where()
    entered_otp = params[:OTP]
    if entered_otp.present? && @@message.present?
        if @@message == entered_otp
            @user=User.where(contactnumber: user_contactnumber).first
            sign_in @user
            redirect_to after_sign_in_path_for(@user)
        else
            redirect_to otp_form_path
        end
    end
  end
end
