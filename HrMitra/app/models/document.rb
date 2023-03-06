class Document < ApplicationRecord
  # belongs_to :employee,class_name: "Employee", foreign_key: "uploader_id"
  belongs_to :employee

  validates :name, :doc_type , presence: true
end
