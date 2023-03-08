class Room < ApplicationRecord
    has_many :players ,dependent: :destroy
    validates :name, presence: true,uniqueness: true
end
