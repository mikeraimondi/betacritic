require 'spec_helper'

describe Movie do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:contributor_id) }

  # year and contributor_id must be a number
end