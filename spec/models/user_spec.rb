require 'spec_helper'

describe User do
  it { should have_many :posts }
  it { should validate_uniqueness_of :username }
  it { should validate_uniqueness_of :email }

  describe '#gravatar_url' do
    context 'with a valid email address' do
      it "should match the correct url" do
        matt = User.create(email: "mknicos@gmail.com", username: "mknicos", password: "12345678", password_confirmation: "12345678")
        matt.gravatar_url.should == "http://www.gravatar.com/avatar/3f7c9c3ebb67cc49028e07dd03ce980c"
      end
    end

    context "with an email that has uppercase characters" do
      it "should match the correct url" do
        matt = User.create(email: "MKnicos@gmail.com", username: "mknicos", password: "12345678", password_confirmation: "12345678")
        matt.gravatar_url.should == "http://www.gravatar.com/avatar/3f7c9c3ebb67cc49028e07dd03ce980c"
      end
    end

    context "with an email that has white space after" do
      it "should match the correct url" do
        matt = User.create(email: "mknicos@gmail.com  ", username: "mknicos", password: "12345678", password_confirmation: "12345678")
        matt.gravatar_url.should == "http://www.gravatar.com/avatar/3f7c9c3ebb67cc49028e07dd03ce980c"
      end
    end
  end

  describe 'username' do
    it { should allow_value('matt').for(:username) }
    it { should_not allow_value('as df jkl').for(:username) }
    it { should_not allow_value('matt?').for(:username) }
    it { should_not allow_value('matt=matt').for(:username) }
    it { should_not allow_value('matt%').for(:username) }
  end

end
