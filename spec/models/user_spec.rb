require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:adrian) { User.create(email: 'adrian', password:'123456') }

  describe "the validations!!" do
    it {should validate_presence_of(:email) }
    it {should validate_length_of(:password).is_at_least(6).on(:create) }
    it {should validate_presence_of(:session_token) }
    it {should validate_presence_of(:password_digest) }
  end

  describe "#is_password?" do

    it "tests if a password is correct" do
      expect(adrian.is_password?("123456")).to eq(true)
    end

    it "tests is a password is incorrect!" do
      expect(adrian.is_password?("123")).to eq(false)
    end
  end

  describe "#reset_session_token!" do
    it "change the session token" do
      previous_token = adrian.session_token
      expect(adrian.reset_session_token!).not_to eq(previous_token)
    end
  end

  describe "::find_by_credentials" do
    it "will return the user object when passed the correct credentials" do
      expect(User.find_by_credentials('adrian','123456')).to eq(User.first)
    end
  end
end
