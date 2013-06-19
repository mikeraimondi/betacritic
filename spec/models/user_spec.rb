require 'spec_helper'

describe User do
  it { should have_many(:movies) }
  it { should have_many(:viewings).dependent(:destroy) }
  it { should have_many(:reviews) }

  it { should validate_presence_of(:role) }
  it { should allow_value('user').for(:role) }
  it { should allow_value('admin').for(:role) }
  it { should_not allow_value('panda').for(:role) }

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
