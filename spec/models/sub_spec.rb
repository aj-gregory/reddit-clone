require 'spec_helper'

describe Sub do
  it "should validate name" do
    FactoryGirl.build(:sub, name: nil).should_not be_valid
  end

  it "should validate moderator_id" do
    FactoryGirl.build(:sub, moderator_id: nil).should_not be_valid
  end

  it "should have a valid factory" do
    FactoryGirl.create(:sub).should be_valid
  end

  it { should belong_to(:moderator) }
  it { should have_many(:links) }
  it { should have_many(:link_subs)}

end
