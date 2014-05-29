require 'spec_helper'
require 'carrierwave/test/matchers'

describe Post do
  it { should belong_to :user }
  it { should validate_presence_of :content }
  it { should validate_presence_of :user }
end
