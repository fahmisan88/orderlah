class PhoneNumbersController < ApplicationController

  def edit
    @phone_number = PhoneNumber.find(params[:id])
  end


  def update
    @phone_number = PhoneNumber.find_or_create_by(phone_number: params[:phone_number][:phone_number])
    @phone_number.generate_pin
    send_pin @phone_number
    respond_to do |format|
      format.js # render app/views/phone_numbers/create.js.erb
    end
  end


  def verify
    @phone_number = PhoneNumber.find_by(phone_number: params[:hidden_phone_number])
    @phone_number.verify(params[:pin])
    respond_to do |format|
      format.js
      redirect_to restaurant_applications_path
    end
  end

  private

  def phone_number_params
    params.require(:phone_number).permit(:phone_number, :pin, :verified)
  end

  def twilio_client
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_pin (number)
    twilio_client.messages.create(
      to: number.phone_number,
      from: ENV['TWILIO_PHONE_NUMBER'],
      body: "Hi, use this pin no: #{number.pin} to claim 1 Juta from Jibby!"
    )
  end
end
