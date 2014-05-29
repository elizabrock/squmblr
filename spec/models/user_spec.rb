require 'spec_helper'

describe User do
  it { should have_many :posts }
  it { should have_many :ratings }
  it { should validate_uniqueness_of :username }
  it { should validate_uniqueness_of :email }

  describe '#gravatar_url' do
    context 'with a valid email address' do
      it "should match the correct url" do
        matt = User.create(email: "mknicos@gmail.com", username: "mknicos", password: "1234", password_confirmation: "1234")
        matt.gravatar_url.should == "http://www.gravatar.com/avatar/3f7c9c3ebb67cc49028e07dd03ce980c"
      end
    end

    context "with an email that has uppercase characters" do
      it "should match the correct url" do
        matt = User.create(email: "MKnicos@gmail.com", username: "mknicos", password: "1234", password_confirmation: "1234")
        matt.gravatar_url.should == "http://www.gravatar.com/avatar/3f7c9c3ebb67cc49028e07dd03ce980c"
      end
    end

    context "with an email that has white space after" do
      it "should match the correct url" do
        matt = User.create(email: "mknicos@gmail.com  ", username: "mknicos", password: "1234", password_confirmation: "1234")
        matt.gravatar_url.should == "http://www.gravatar.com/avatar/3f7c9c3ebb67cc49028e07dd03ce980c"
      end
    end
  end
end
