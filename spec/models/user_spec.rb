require 'spec_helper'

describe User do
  it { should have_many :posts }
  it { should validate_uniqueness_of :username }
  it { should validate_uniqueness_of :email }

  describe '#gravatar_url' do
    context 'with a valid email address' do
      it "should match the correct url" do
        matt = Fabricate(:user, email: "mknicos@gmail.com")
        matt.gravatar_url.should == "http://www.gravatar.com/avatar/3f7c9c3ebb67cc49028e07dd03ce980c"
      end
    end

    context "with an email that has uppercase characters" do
      it "should match the correct url" do
        matt = Fabricate(:user, email: "MKnicos@gmail.com")
        matt.gravatar_url.should == "http://www.gravatar.com/avatar/3f7c9c3ebb67cc49028e07dd03ce980c"
      end
    end

    context "with an email that has white space after" do
      it "should match the correct url" do
        matt = Fabricate(:user, email: "mknicos@gmail.com  ")
        matt.gravatar_url.should == "http://www.gravatar.com/avatar/3f7c9c3ebb67cc49028e07dd03ce980c"
      end
    end
  end
end
