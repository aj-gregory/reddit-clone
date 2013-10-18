require 'spec_helper'

describe LinkVote do
  it { should belong_to(:voter)}
  it { should belong_to(:link)}
end
