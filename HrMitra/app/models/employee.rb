class Employee < ApplicationRecord
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :city, :state, :country, :pincode, :address, presence: true

    def name 
        "#{first_name} #{middle_name} #{last_name}".strip
    end
    def full_address
        "#{address} #{city}, #{state}, #{country}, #{pincode}".strip
    end
end
