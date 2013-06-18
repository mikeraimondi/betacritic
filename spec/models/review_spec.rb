require 'spec_helper'

describe Review do

  it { should belong_to(:user) }
  it { should belong_to(:movie) }
  it { should validate_presence_of(:movie) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:body) } 

end