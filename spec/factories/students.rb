FactoryBot.define do
    # 作成するテストデータの名前を「student」とします
    # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
    factory :student do
      name   { 'sample_student01' }
      course { 'level_1' }
      enrollment_status { 'yyes'}
      site {'jiyugaoka'}
      school_year {'fifth_grader'}
      parent_name {'sample_parent01'}
      phone_number {'0311112222'}
      email_address {'sample_parent01@test.com'}
      live_address {'東京都目黒区'}
    end
    factory :second_student, class: Student do
      name   { 'sample_student02' }
      course { 'level_2' }
      enrollment_status { 'yyes'}
      site {'shibuya'}
      school_year {'seventh_grader'}
      parent_name {'sample_parent02'}
      phone_number {'0322223333'}
      email_address {'sample_parent02@test.com'}
      live_address {'東京都渋谷区'}
    end    
    factory :third_student, class: Student do
      name   { 'sample_student03' }
      course { 'level_3' }
      enrollment_status { 'nno'}
      site {'kichijoji'}
      school_year {'ninth_grader'}
      parent_name {'sample_parent03'}
      phone_number {'0333334444'}
      email_address {'sample_parent03@test.com'}
      live_address {'東京都杉並区'}
    end  
    factory :forth_student, class: Student do
      name   { 'sample_student04' }
      course { 'level_4' }
      enrollment_status { 'yyes'}
      site {'yotsuya'}
      school_year {'eleventh_grader'}
      parent_name {'sample_parent04'}
      phone_number {'0344445555'}
      email_address {'sample_parent04@test.com'}
      live_address {'東京都新宿区'}
    end       
    factory :fifth_student, class: Student do
      name   { 'sample_student05' }
      course { 'scholars' }
      enrollment_status { 'nno'}
      site {'jiyugaoka'}
      school_year {'seventh_grader'}
      parent_name {'sample_parent05'}
      phone_number {'0355556666'}
      email_address {'sample_parent05@test.com'}
      live_address {'東京都大田区'}
    end               
end
