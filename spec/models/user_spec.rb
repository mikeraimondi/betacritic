require 'spec_helper'

describe User do
  it { should have_many(:movies) }
  it { should have_many(:viewings).dependent(:destroy) }
  # it { should have_many(:reviews) }
end
