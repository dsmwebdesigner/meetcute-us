require 'spec_helper'

describe Design do

  it "has a valid factory" do
    expect(create(:design)).to be_valid
  end
  
  it { should have_many(:sites).through(:site_designs) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
