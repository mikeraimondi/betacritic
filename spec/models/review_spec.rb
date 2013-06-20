require 'spec_helper'

describe Review do

  it { should belong_to(:user) }
  it { should belong_to(:movie) }
  it { should validate_presence_of(:movie) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:body) } 

  it { should allow_value(1).for(:rating) }
  it { should allow_value(10).for(:rating) }
  it { should_not allow_value(0).for(:rating) }
  it { should_not allow_value(11).for(:rating) }
  it { should_not allow_value(-1).for(:rating) }

end