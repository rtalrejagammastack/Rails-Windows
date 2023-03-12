class User < ApplicationRecord
    before_save :downcase_email
    has_one :session , dependent: :destroy
    has_one :player
    has_one :room, through: :player
    validates :name,:password,presence: true  
    # validates :email,presence: true,uniqueness: true,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}  
    validates :email,presence: true, uniqueness: true,format: {with: URI::MailTo::EMAIL_REGEXP}

    private
        def downcase_email
            self.email = email.downcase
        end
end
