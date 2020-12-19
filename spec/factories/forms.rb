FactoryBot.define do
  factory :form do
    number {'10001'}
    name   { 'sample_student01' }
    application_date { '2020-12-19' }
    classification { 'rest' }
    month{ Date.new(2021, 1) }
    f_month{ Date.new(2021, 3) }
    reason {'entance_exam'}
  end
end


