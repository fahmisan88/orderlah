class PhoneNumber < ApplicationRecord
  belongs_to :restaurant_application

  validates :phone,:presence => true,
                 :length => { :minimum => 11, :maximum => 15 }

  def generate_pin
    self.pin = rand(0000..9999).to_s.rjust(4, "0")
    save
  end

  def verify(entered_pin)
    update(verified: true) if self.pin == entered_pin
  end



end
