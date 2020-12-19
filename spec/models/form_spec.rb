require 'rails_helper'

describe 'formモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context '申請フォームを新規で作成する際に必須項目が一つでも空の場合' do
      it 'バリデーションにひっかる' do
        form = Form.new(number: '100001', name: '', application_date: '2020/12/19',classification: 'rest', 
                             month: '2021/01', f_month: '2021/04', reason: 'entance_exam')
        expect(form).not_to be_valid
      end
      
      it 'バリデーションが通る' do
        form = Form.new(number: '100001', name: 'hogeo', application_date: '2020/12/19',classification: 'rest', month: '2021/1/1', f_month: '2021/3/1', reason: 'entance_exam')
        expect(form).to be_valid
      end
    end
  end
end