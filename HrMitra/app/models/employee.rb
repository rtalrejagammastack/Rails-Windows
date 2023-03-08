class Employee < ApplicationRecord
    before_save :calculate_age

    has_many :documents, dependent: :destroy

    # validates :middle_name, allow_blank: true,presence: true

    validates :first_name,:last_name, presence: true
    validates :job_title, presence: true
    validates :email, presence: true, uniqueness: true,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
    validates :city, :state, :country, :address, presence: true
    validate :check_age
    validate :check_joining_date
    validates :pincode, presence: true, pincode_six_length: true

    JOB_TITLE_TYPES = ['Solution Engineer',"ROR Developer","Full Stack Developer","React Developer","React Native Developer","Android Developer","IOS Developer"]

    def name 
        "#{first_name} #{middle_name} #{last_name}".strip
    end

    def full_address
        "#{address} #{city}, #{state}, #{country}, #{pincode}".strip
    end

    def name_with_email
        "#{name}(#{email})"
    end
    def current_age
        Date.today.year - date_of_birth.year
    end
    
    private
    def calculate_age
        self.age = Date.today.year - date_of_birth.year
    end
    def check_age
        if(!date_of_birth)
            self.errors.add(:date_of_birth," can't be blank.")
        elsif(Date.today.year - date_of_birth.year)<=18
            self.errors.add(:date_of_birth," must be greater than 18.")
        end 
    end
    def check_joining_date
        if(!date_of_joining)
            self.errors.add(:date_of_joining," can't be blank.")
        elsif (date_of_joining <= Date.today)
            self.errors.add(:date_of_joining,"must be greater than todays date.")
        end
    end
end
