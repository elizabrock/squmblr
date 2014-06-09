require 'spec_helper'
  describe Comment do
  it { should belong_to :post }
  it { should belong_to :user }
  it { should validate_presence_of :comment }
  it { should validate_presence_of :post }
  it { should validate_presence_of :user }
  end
