require 'rails_helper'
RSpec.describe '生徒管理機能', type: :system do
    before do
      FactoryBot.create(:student)
      FactoryBot.create(:second_student)
      FactoryBot.create(:third_student)
      FactoryBot.create(:forth_student)
      FactoryBot.create(:fifth_student)           
    end
    describe '生徒作成機能' do
      context '生徒を新規作成した場合' do
        it '作成した生徒が表示される' do
          visit new_student_path
          fill_in 'student_name', with: 'sample_student01'
          select 'student_course', with: 'level_1'
          select 'student_enrollment_status', with: 'yyes'
          select 'student_site', with: 'jiyugaoka'
          select 'student_school_year', with: 'fifth_grader'
          fill_in 'student_parent_name', with: 'sample_parent01'
          fill_in 'student_phone_number', with: '0311112222'
          fill_in 'student_email_address', with: 'sample_parent01@test.com'
          fill_in 'student_live_address', with: '東京都目黒区'
          click_on "登録する"
        end
      end
    end
    describe '生徒一覧表示機能' do
      context '生徒一覧画面に遷移した場合' do
        it '作成済みの生徒一覧が表示される' do
        end
      end
    end
    describe '生徒詳細表示機能' do
       context '任意の生徒詳細画面に遷移した場合' do
         it '該当生徒の内容が表示される' do
         end
       end
    end
  end