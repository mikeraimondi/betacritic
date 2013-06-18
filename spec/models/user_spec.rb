require 'spec_helper'

describe User do
  it { should have_many(:movies) }
  # it { should have_many(:reviews) }

  describe 'like_for method' do
    let(:movie) {FactoryGirl.create(:movie)}
    let(:user) {FactoryGirl.create(:user)}

    it 'should return nil if user has not liked movie' do
      user.like_for(movie).should be_nil
    end

    it 'should return an object if user has liked movie' do
      like = FactoryGirl.create(:like, user: user, likable: movie)
      user.like_for(movie).should_not be_nil
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
end
