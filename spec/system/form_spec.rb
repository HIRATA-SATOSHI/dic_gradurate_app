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
            select '休塾', from: @form.classification
            select '2021', from: 'form_month_1i'
            select '1月', from: 'form_month_2i'
            select '2021', from: 'form_f_month_1i'
            select '3月', from: 'form_f_month_2i'          
            select '受験準備', from: 'form_reason'
            click_on "送信する"
            expect(current_path).to eq confirm_forms_path
          end
        end
      end
end