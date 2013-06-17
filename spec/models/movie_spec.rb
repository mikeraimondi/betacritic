require 'spec_helper'

describe Movie do

  let(:movie) {FactoryGirl.build(:movie)}

  it { should have_many(:viewings) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:contributor) }

  it 'will not submit if year is not a number' do
    movie.year = 'Meow'
    expect(movie).to_not be_valid
  end

  it 'will not submit if year is not within range' do
    movie.year = '9999'
    expect(movie).to_not be_valid
  end
end
