require 'spec_helper'

describe Viewing do
  it { should belong_to(:user) }
  it { should belong_to(:viewable) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:viewable) }

  describe "recently viewed movies" do
    let(:user)      { FactoryGirl.create(:user) }
    let!(:viewing1)  { FactoryGirl.create(:viewing, user: user) }
    let!(:viewing2)  { FactoryGirl.create(:viewing, user: user) }
    let!(:viewing3)  { FactoryGirl.create(:viewing, user: user) }
    let!(:viewing4)  { FactoryGirl.create(:viewing, user: user) }

    it "returns the last 3 modified viewings" do
      expect(Viewing.recent_movies(user)).to include(viewing2, viewing3, viewing4)
    end

    it "does not return an older viewing" do
      expect(Viewing.recent_movies(user)).to_not include(viewing1)
    end
  end
end
