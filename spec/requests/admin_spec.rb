require 'spec_helper'

describe 'Wing Management' do
  before do
    visit admin_path
  end

  it 'creates wing' do
    Wing.count.should == 0

    click_link 'Wing Management'
    current_path.should == admin_wings_path
    click_link 'Add a Wing'
    current_path.should == new_admin_wing_path
    fill_in 'Name', with: 'Saint Nicholas Wing'
    click_button 'Save'
    

    Wing.count.should == 1
    Wing.first.name.should == 'Saint Nicholas Wing'
  end

  context 'with a project' do
    before do
      @wing = FactoryGirl.create :wing
      click_link 'Wing Management'
    end

    it 'edits a wing' do
      click_link 'North'

      current_path.should == edit_admin_wing_path(@wing)

      fill_in 'Name', with: 'Saint Nicholas Wing'
      fill_in 'Amount of Rooms', with: 15
      click_button 'Save'  

      @wing.reload
      @wing.name.should == 'Saint Nicholas Wing'
      @wing.amount_of_rooms == 15
    end

    it 'deletes a wing' do
      Wing.count.should == 1

      click_link 'North'
      current_path.should == edit_admin_wing_path(@wing)

      click_link 'Delete Wing'
      current_path.should == admin_wings_path

      Wing.count.should == 0
    end
  end
end
