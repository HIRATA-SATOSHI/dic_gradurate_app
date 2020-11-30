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
          select 'レベル1', from: 'student_course'
          select '通塾中', from: 'student_enrollment_status'
          select '自由が丘', from: 'student_site'
          select '小5', from: 'student_school_year'
          fill_in 'student_parent_name', with: 'sample_parent01'
          fill_in 'student_phone_number', with: '0311112222'
          fill_in 'student_email_address', with: 'sample_parent01@test.com'
          fill_in 'student_live_address', with: '東京都目黒区'
          click_on "登録する"
          expect(current_path).to eq confirm_students_path
        end
      end
    end
    describe '生徒一覧表示機能' do
      context '生徒一覧画面に遷移した場合' do
        it '作成済みの生徒一覧が表示される' do
          visit students_path
          expect(page).to have_content 'sample_student01'
          expect(page).to have_content '自由が丘'
          expect(page).to have_content 'レベル1'
          expect(page).to have_content '通塾中'

        end
      end
    end
    describe '生徒詳細表示機能' do
       context '任意の生徒詳細画面に遷移した場合' do
         it '該当生徒の内容が表示される' do
         end
       end
    end
    describe '検索機能' do
      before do
      end

      context 'あいまいな検索をかける' do
        it '検索ワードを含むタスクで絞り込まれる' do
          visit students_path
          fill_in "q_name_cont", with: "03"
          click_on "検索"
          expect(page).to have_content 'sample_student03'
          expect(page).not_to have_content 'example'
        end
      end

      context '範囲検索をかける' do
        it '生徒IDの範囲検索を行う'do
          visit students_path
          fill_in "q_id_gteq", with: "1"
         fill_in "q_id_lt", with: "2"
          click_on "検索"
          expect(page).to have_content '1'
          expect(page).not_to have_content '0'         
        end
      end
    end
  end