class Employee < ApplicationRecord
    before_save :calculate_age

    has_many :documents, dependent: :destroy

    # validates :middle_name, allow_blank: true,presence: true

    validates :first_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :city, :state, :country, :address, presence: true
    validate :check_age
    validates :pincode, presence: true, pincode_six_length: true

    def name 
        "#{first_name} #{middle_name} #{last_name}".strip
    end

    def full_address
        "#{address} #{city}, #{state}, #{country}, #{pincode}".strip
    end

    def name_with_email
        "#{name}(#{email})"
    end
    
    private
    def calculate_age
        self.age = Date.today.year - dob.year
    end
    def check_age
        if(!dob)
            self.errors.add(:dob," can't be blank.")
        elsif(Date.today.year - dob.year)<=18
            self.errors.add(:dob," must be greater than 18.")
        end 
    end
end
