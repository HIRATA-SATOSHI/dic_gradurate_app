FactoryBot.define do
  factory :staff do
    id { 1 }
    name { 'test_staff_01' }
    email { 'test_staff_01@test.com' }
    password { '12345678' }
    department { '自由が丘校事務局'}
    admin { false }  
  end
  factory :second_staff, class: Staff do
    id { 2 }
    name { 'test_admin_staff' }
    email { 'test_admin_staff@test.com' }
    password { '87654321' }
    department { '管理部'}
    admin { true }
  end
end
