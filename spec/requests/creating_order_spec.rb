require 'spec_helper'

describe 'Creating an Order' do
  before do
    @wing = FactoryGirl.create :wing
    visit root_path
  end

  it 'views the wings of the hospital' do
    current_path.should == root_path
    page.should have_content(@wing.name)
  end
end
