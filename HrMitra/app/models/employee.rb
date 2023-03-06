class Employee < ApplicationRecord
    before_save :calculate_age

    has_many :documents

    # validates :middle_name, allow_blank: true,presence: true

    validates :first_name, :last_name,:dob, presence: true
    validates :email, presence: true, uniqueness: true
    validates :city, :state, :country, :pincode, :address, presence: true

    def name 
        "#{first_name} #{middle_name} #{last_name}".strip
    end

    def full_address
        "#{address} #{city}, #{state}, #{country}, #{pincode}".strip
    end



    private
    def calculate_age
        self.age = Date.today.year - dob.year
    end


end
