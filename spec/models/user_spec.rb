require 'spec_helper'

describe User do
  it { should have_many(:movies) }
  it { should have_many(:viewings) }
  # it { should have_many(:reviews) }

  it { should validate_presence_of(:role) }
  it { should allow_value('user').for(:role) }
  it { should allow_value('admin').for(:role) }
  it { should_not allow_value('panda').for(:role) }
end
