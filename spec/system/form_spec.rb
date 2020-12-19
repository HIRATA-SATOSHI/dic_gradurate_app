require 'rails_helper'
RSpec.describe '申請フォーム作成機能', type: :system do
    before do
      @form = FactoryBot.create(:form)
    end
    describe '申請フォーム作成機能' do
        context 'フォームを新規作成し申請した場合' do
          it '確認画面が表示される' do
            visit new_form_path
            fill_in 'form_number', with: @form.number
            fill_in 'form_name', with: @form.name
            fill_in 'form_application_date', with: @form.application_date
            select '休塾', from: 'form_classification'
            select '2021', from: 'form_month_1i'
            select '1月', from: 'form_month_2i'
            select '2021', from: 'form_f_month_1i'
            select '3月', from: 'form_f_month_2i'           
            select '受験準備', from: 'form_reason'
            click_on "送信する"
            expect(current_path).to eq confirm_forms_path
          end
        end
        # context '確認画面から送信する押した場合' do
        #   it '送信完了画面が表示される' do
        #     visit confirm_forms_path
        #     click_on "送信する"
        #     expect(page).to have_content '休退塾申請フォームは無事に送信完了しました！'
        #   end
        # end
    end
end