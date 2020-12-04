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
      it "ログイン画面に戻る" do
        visit students_path
        find("button.btn btn-danger btn-sm").click
        expect(page).to have_content "ログアウトしました"
      end      
    end
  end

#   describe 'スタッフ登録のテスト' do
#     before do
#       @second_staff = FactoryBot.create(:second_staff)
#     end
#     context '管理者スタッフでログインしている' do
#       it 'ログインができること' do
#         visit new_session_path
#         fill_in 'session_email', with: @second_staff.email
#         fill_in 'session_password', with: @second_staff.password
#         click_on "ログイン" 
#       end
#     end

#       it 'スタッフ新規登録のテスト' do
#         visit new_admin_staff_path
#         fill_in 'staff_name', with: 'test_staff_01'
#         fill_in 'staff_email', with: 'test_staff_01@test.com'
#         fill_in 'staff_password', with: '12345678'
#         fill_in 'staff_password_confirmation', with: '12345678'
#         fill_in '自由が丘校事務局'
#         click_on '登録する'
#         expect(page).to have_content 'test_user_01'
#       end  
#   end  

end
