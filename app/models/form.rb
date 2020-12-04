class Form < ApplicationRecord
  validates :student_id, :name, :classification, :month, :f_month, :reason,  presence: true
  enum classification: {leave: 0, rest: 1}
  
end
