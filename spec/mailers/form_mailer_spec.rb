require "rails_helper"

describe FormMailer do

  describe 'メール送信ボタンを押す' do
    subject(:mail) do
      described_class.send_mail.deliver_now
      ActionMailer::Base.deliveries.last
    end

    context 'メール受信した時' do
      it { expect(mail.from.first).to eq('jprepzdm@gmail.com') }
      it { expect(mail.to.first).to eq('sample_parent01@test.com') }
      it { expect(mail.subject).to eq('申請のあった休退塾届をお送りします。') }
      it { expect(mail.body).to match(/この度は,J PREP事務局にお問い合わせいただきありがとうございました。
      お問合せがございました、休塾および退塾に関わる申請をお送りいたします。
      以下のリンクよりお入りいただき申請の方の提出をお願い致します。
      スタッフ一同、またの校舎でお目にかかるのを心よりお待ち申し上げます。/) }
    end
  end
end
