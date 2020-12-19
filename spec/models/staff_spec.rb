require 'rails_helper'

describe 'staffモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'スタッフを新規で作成する際に必須項目が一つでも空の場合' do
      it 'バリデーションにひっかる' do
        staff = Staff.new(name: 'hogehoge', email: 'hoge@hoge.com', department: '')
        expect(staff).not_to be_valid
      end
    end
    context 'スタッフを新規で作成する際に必須項目を全部入れた場合' do
      it 'バリデーションにひっかからない' do
        staff = Staff.new(name: 'hogehoge', email: 'hoge@hoge.com', password: 'hoge@hoge.com', department: 'support_desk')
        expect(staff).to be_valid
      end
    end

  end
end
