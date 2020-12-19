require 'rails_helper'
RSpec.describe '生徒管理機能', type: :system do
    before do
      @staff = FactoryBot.create(:staff)
      visit new_staff_session_path
      fill_in 'staff_email', with: "test_staff_01@test.com"
      fill_in 'staff_password', with: "12345678"
      click_on 'ログイン'
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
          fill_in 'student_number', with: '10001'
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
      context '生徒一覧の生徒番号をクリックすると' do
        it '降順の並びで表示される' do     
          visit students_path
          click_link '生徒番号' 
          visit students_path(sort_expired: "true")
          student_list = all('.student_list')
        end
      end
    end

    describe '生徒詳細表示機能' do
      context '任意の生徒詳細画面に遷移した場合' do
        it '該当生徒の内容が表示される' do
         end
      end
    end

    describe '生徒詳細表示機能' do
      context '任意の生徒詳細画面の申請フォーム送付を押した時' do
        it 'その生徒へ申請フォームがメールで送付される' do
          visit students_path
          click_link '10001'
          expect(page).to have_content '10001'
          click_link '申請フォーム送付'
          expect {
            page.accept_confirm "この生徒へ休退塾申請を送信しますか？"
            expect(page).to have_content "この生徒へ休退塾申請フォームを送りました"
          }
          #  visit letter_path
          #  expect(page).to have_content '申請のあった休退塾届をお送りします。'
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
        it '生徒番号の範囲検索を行う'do
          visit students_path
          fill_in "q_number_gteq", with: "10001"
         fill_in "q_number_lteq", with: "10001"
          click_on "検索"
          expect(page).to have_content '10001'
          expect(page).not_to have_content '10002'         
        end
      end

      context '通塾校舎をラジオボタンで選択' do
        it '通塾校舎毎に生徒を検索' do
          visit students_path
          choose 'q_site_eq_0'
          click_on "検索"
          expect(page).to have_content '自由が丘'
          expect(page).to have_no_content 'gege'            
        end
      end
        context '通塾コースをラジオボタンで選択' do
          it '通塾コース毎に生徒を検索' do
            visit students_path
            choose 'q_course_eq_0'
            click_on "検索"
            expect(page).to have_content 'レベル1'
            expect(page).to have_no_content 'hoge'           
          end
        end
        context '在籍状況をラジオボタンで選択' do
            it '在籍状況毎に生徒を検索' do
              visit students_path
              choose 'q_enrollment_status_eq_0'
              click_on "検索"
              expect(page).to have_content '通塾中'
              expect(page).to have_no_content '秘密のパスワード'
                          
            end
          end
    end
  end