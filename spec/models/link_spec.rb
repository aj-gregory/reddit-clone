require 'spec_helper'

describe Link do
  it "should validate title" do
    FactoryGirl.build(:link, title: nil).should_not be_valid
  end

  it "should validate url" do
    FactoryGirl.build(:link, url: nil).should_not be_valid
  end

  it "should validate submitter_id" do
    FactoryGirl.build(:link, submitter_id: nil).should_not be_valid
  end


  it { should_not belong_to(:sub) }
  it { should belong_to(:submitter) }

  it { should have_many(:link_subs)}
  it { should have_many(:subs)}

  it { should have_many(:comments)}

  it { should have_many(:votes)}
  it { should have_many(:voters)}
end
