require "rails_helper"

RSpec.describe FormMailer, type: :mailer do
  describe 'メール送信テスト' do
    @student = student
      mail from:
      mail to:  student.email_address,
      subject: '申請のあった休退塾届をお送りします。'
   context 'メールを送信した場合' do
     it 'ヘッダーに表示される' do
       expect(mail.from).to eq("J PREP休退塾届管理事務局")
       expect(mail.to).to eq("sample_parent01@test.com")
       expect(mail.subject).to eq('申請のあった休退塾届をお送りします。') 
     end

     it "本文に表示される" do
       expect(mail.body).to match(/この度は,J PREP事務局にお問い合わせいただきありがとうございました。
        お問合せがございました、休塾および退塾に関わる申請をお送りいたします。
        以下のリンクよりお入りいただき申請の方の提出をお願い致します。
        スタッフ一同、またの校舎でお目にかかるのを心よりお待ち申し上げます。/)
     end
    end
  end
end
