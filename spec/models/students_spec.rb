require 'rails_helper'

describe 'studentモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context '生徒を新規で作成する際に必須項目が一つでも空の場合' do
      it 'バリデーションにひっかる' do
        student = Student.new(number: '100001', name: 'hogehoge', course: 'level_1',enrollment_status: 'yyes', 
                             site: 'shibuya', school_year: 'fifth_grader', parent_name: 'hogeoya', email_address: 'hoge@hoge.com', phone_number: '')
        expect(student).not_to be_valid
      end
    end
    context '生徒を新規で作成する際に必須項目を全部入れた場合' do
      it 'バリデーションにひっかからない' do
        student = Student.new(number: '99999', name: 'hogehoge', course: 'level_1',enrollment_status: 'yyes', 
                             site: 'shibuya', school_year: 'fifth_grader', parent_name: 'hogeoya', email_address: 'hoge@hoge.com', phone_number: '0355552223')
        expect(student).to be_valid
      end
    end

  end
end


