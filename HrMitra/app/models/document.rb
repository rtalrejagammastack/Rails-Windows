class Document < ApplicationRecord
  belongs_to :employee
  
  has_one_attached :image

  # validate :check_employee_id
  validates :employee_id,presence: true
  
  validates :name, :doc_type , presence: true
  
  DOC_TYPES = ['Marksheet','Photo Id','Address Proof','Personal ID','Others'].freeze

  private 
    # def check_employee_id
    #   if employee_id == nil
    #     self.errors.add(:employee_id," Id can't be blank.")
    #   elsif Employee.find_by(id:employee_id)==nil
    #     self.errors.add(:employee_id," Id does not exist.")
    #   end
    # end
end
