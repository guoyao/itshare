require 'spec_helper'

describe Experience do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @experience = user.experiences.build(company: "Test Company 1",
                                         title: "Test Experience Title",
                                         details: "Test Experience details")
  end

  subject { @experience }

  it { should respond_to(:company) }
  it { should respond_to(:title) }
  it { should respond_to(:details) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @experience.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Experience.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "with blank title" do
    before { @experience.title = "" }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @experience.title = "a" * 31 }
    it { should_not be_valid }
  end
end
