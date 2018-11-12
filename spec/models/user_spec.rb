require 'rails_helper'

RSpec.describe User, type: :model do :each

  describe "password validations" do
    subject {
      described_class.new(first_name: "Mark", email: "mark@mark.com", password: "123456", password_confirmation: "123456")
    }

    it "should take two passwords" do
      expect(subject.password).to be_a(String)
      expect(subject.password_confirmation).to be_a(String)
      expect(subject.password_confirmation).to eq(subject.password)

      expect(subject).to be_valid
    end

    it "should ensure the passwords match" do
      subject.password_confirmation = "abcdefg"
      expect(subject.password_confirmation).not_to eq(subject.password)

      expect(subject).not_to be_valid
    end

    it "should require passwords to be equal to or greater than 6 characters" do
      subject.password = "12345"
      subject.password_confirmation = "12345"
      expect(subject).not_to be_valid
    end

    it "should not allow duplicate emails" do
      subject.save
      @secondUser = User.new(first_name: "Idiot Pants", email: "MARK@mark.com", password: "123456", password_confirmation: "123456")
      expect(@secondUser).not_to be_valid
    end
  end

  describe "Checking user sessions" do
    subject {
      described_class.new(first_name: "Mark", email: "mark@mark.com", password: "123456", password_confirmation: "123456")
    }

    it "should verify email / password before logging in" do
      subject.save
      expect(User.authenticate_with_credentials("   MARK@mark.com    ", subject.password).id).to be_a(Integer)
    end
  end

end
