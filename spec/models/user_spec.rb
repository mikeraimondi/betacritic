require 'spec_helper'

describe User do
  it { should have_many(:movies) }
  it { should have_many(:viewings).dependent(:destroy) }
  # it { should have_many(:reviews) }

  it { should validate_presence_of(:role) }
  it { should allow_value('user').for(:role) }
  it { should allow_value('admin').for(:role) }
  it { should_not allow_value('panda').for(:role) }

  it { should have_many(:likes).dependent(:destroy) }

  describe 'like_for method' do
    let(:movie) {FactoryGirl.create(:movie)}
    let(:user) {FactoryGirl.create(:user)}

    it 'should return nil if user has not liked movie' do
      user.like_for(movie).should be_nil
    end

    it 'should return an object if user has liked movie' do
      like = FactoryGirl.create(:like, user: user, likable: movie)
      user.like_for(movie).should == like
    end
  end

  describe 'likes_movie method' do
    let(:movie) {FactoryGirl.create(:movie)}
    let(:user) {FactoryGirl.create(:user)}

    it 'should return false if user has not liked movie' do
      user.likes_movie?(movie).should be_false
    end

    it 'should return true if user likes movie' do
      like = FactoryGirl.create(:like, user: user, likable: movie)
      user.likes_movie?(movie).should be_true
    end
  end

  context 'when Admin' do
    let(:user) {FactoryGirl.create(:user)}
    let(:admin) {FactoryGirl.create(:admin)}

    it "returns false" do
      user.admin?.should be_false
    end

    it "returns true" do
      admin.admin?.should be_true
    end
  end
end
