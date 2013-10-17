require 'spec_helper'

describe User do
  it "should have a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "should validate the user's name" do
    FactoryGirl.build(:user, name: nil).should_not be_valid
  end

  it "should validate the password's length" do
    FactoryGirl.build(:user, password: 'abc').should_not be_valid
  end

  it "should have a different password_digest" do
    FactoryGirl.build(:user, password: '123456').password_digest.should_not equal('123456')
  end

  it "should find a user by credentials" do
    user = User.create(:name => 'new_user', :password => '123456')
    User.find_by_credentials('new_user', '123456').should be_instance_of(User)
  end

  it { should_not allow_mass_assignment_of(:password_digest) }
  it { should_not allow_mass_assignment_of(:session_token) }
  it { should allow_mass_assignment_of(:name)}

  it { should have_many(:subs)}
  it { should have_many(:submissions)}
end
