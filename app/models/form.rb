class Form < ApplicationRecord
  validates :number, :name, :classification, :month, :f_month, :reason,  presence: true
  enum classification: {leave: 0, rest: 1 }
  enum reason: {result: 0, club_activities: 1, entance_exam: 2, study_abroad:3, others:4 }
  enum cancel: { yes: true, no: false }
  belongs_to :staff
  belongs_to :student
end
