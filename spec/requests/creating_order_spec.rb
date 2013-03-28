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

  context 'with a wing with rooms' do
    it 'goes to the rooms route' do
      click_link @wing.name
      current_path.should == wing_rooms_path(@wing)
    end
  end
end
