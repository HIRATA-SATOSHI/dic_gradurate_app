require "rails_helper"

RSpec.describe FormMailer, type: :mailer do
  describe "send_when_push" do
    let(:mail) { FormMailer.send_when_push }

    it "ヘッダーの表示" do
      expect(mail.subject).to eq("申請のあった休退塾届をお送りします。")
      expect(mail.to).to eq( "student.email_address")
      expect(mail.from).to eq( "J PREP休退塾届管理事務局")
    end

    it "中身の表示" do
      expect(mail.body.encoded).to match("この度は,J PREP事務局にお問い合わせいただきありがとうございました。")
    end
  end

end
