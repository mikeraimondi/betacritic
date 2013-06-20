require 'spec_helper'

describe Like do
  it { should belong_to(:user) }
  it { should belong_to(:likable) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:likable) }
end