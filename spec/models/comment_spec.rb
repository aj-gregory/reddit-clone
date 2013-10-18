require 'spec_helper'

describe Comment do
  it "should validate presence of link_id" do
    FactoryGirl.build(:comment, link_id: nil).should_not be_valid
  end

  it "should validate presence of body" do
    FactoryGirl.build(:comment, body: nil).should_not be_valid
  end

  it "should validate presence of commenter_id" do
    FactoryGirl.build(:comment, commenter_id: nil).should_not be_valid
  end

  it "should not validate presence of parent_id" do
    FactoryGirl.build(:comment, parent_comment_id: nil).should be_valid
  end


  it { should belong_to(:link)}
  it { should belong_to(:commenter)}

  it { should belong_to(:parent_comment)}
  it { should have_many(:child_comments)}

end
