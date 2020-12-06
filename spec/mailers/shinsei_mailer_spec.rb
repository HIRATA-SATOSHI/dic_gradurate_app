require "rails_helper"

RSpec.describe ShinseiMailer, type: :mailer do
  describe "send_when_push" do
    let(:mail) { ShinseiMailer.send_when_push }

    it "renders the headers" do
      expect(mail.subject).to eq("Send when push")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
