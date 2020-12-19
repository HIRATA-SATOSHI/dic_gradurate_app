require 'rails_helper'
RSpec.describe 'ログイン・ログアウト機能・管理画面・スタッフ登録テスト', type: :system do
  describe 'session機能テスト' do
    before do
      @staff = FactoryBot.create(:staff)
      @second_staff = FactoryBot.create(:second_staff)
    end
  
    context "ログインしていない状態でスタッフ情報がある場合" do
      it 'ログインができること' do
        visit new_staff_session_path
        fill_in 'staff_email', with: @staff.email
        fill_in 'staff_password', with: @staff.password
        click_on "ログイン"
      end
      it '生徒検索一覧へ飛べること' do
        visit students_path
      end 
    end

    context "ログインしている場合" do
      before do
        visit new_staff_session_path
        fill_in 'staff_email', with: @staff.email
        fill_in 'staff_password', with: @staff.password
        click_on "ログイン"
      end

      it '一般ユーザはスタッフ一覧には遷移せず生徒一覧のままが表示される' do
        visit admin_staffs_path
        expect(page).to have_content "あなたは管理者ではありません"
      end

      it 'ログアウトができること' do
        visit admin_staffs_path
        click_link "ログアウト"
        expect(page).to have_content "ログアウトしました"      
      end
    end

    context "管理者としてログインしている場合" do
        before do
          visit new_staff_session_path
          fill_in 'staff_email', with: @second_staff.email
          fill_in 'staff_password', with: @second_staff.password
          click_on "ログイン"
        end
  
        it 'スタッフの登録一覧画面に遷移できる' do
          visit admin_staffs_path
        end 
        it 'スタッフの新規登録画面に遷移できる' do
            visit new_admin_staff_path
        end
        it 'スタッフ新規登録ができる' do
          visit new_admin_staff_path
          fill_in 'staff_name', with: 'test_staff_01'
          fill_in 'staff_email', with: 'test_staff_01@test.com'
          fill_in 'staff_password', with: '12345678'
          fill_in 'staff_password_confirmation', with: '12345678'
          select '校舎事務局', from: 'staff_department'
          click_on '登録する'
          expect(page).to have_content 'test_staff_01'
        end

        it 'スタッフの削除ができる' do
            visit admin_staffs_path
            click_link "削除", match: :first          
        end  
      end
  end  
end




