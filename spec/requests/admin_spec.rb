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
    fill_in 'Amount of Rooms', with: 15
    click_button 'Save'
    

    Wing.count.should == 1
    Wing.first.reload
    Wing.first.rooms.count.should == 15
    Wing.first.name.should == 'Saint Nicholas Wing'
  end

  context 'with a wing' do
    before do
      @wing = FactoryGirl.create :wing, amount_of_rooms: 0
      @wing.update_rooms(10)
      @wing.reload
      @wing.update_attribute('amount_of_rooms', 10)
      @wing.reload
      @room = @wing.rooms.first
      click_link 'Wing Management'
    end

    it 'edits a wing' do
      @wing.rooms.count == 10
      click_link 'North'

      current_path.should == edit_admin_wing_path(@wing)

      fill_in 'Name', with: 'Saint Nicholas Wing'
      fill_in 'Amount of Rooms', with: 15
      click_button 'Save'  

      @wing.reload
      @wing.name.should == 'Saint Nicholas Wing'
      @wing.amount_of_rooms == 15
      @wing.rooms.count.should == 15
    end

    it 'deletes a wing' do
      Wing.count.should == 1

      click_link 'North'
      current_path.should == edit_admin_wing_path(@wing)

      click_link 'Delete Wing'
      current_path.should == admin_wings_path

      Wing.count.should == 0
    end

    context 'with a rooms' do
      before do
        @room = @wing.rooms.first
      end

      it 'creates the amount of patients in a rooms' do
        click_link 'North'
        current_url.should == url_for([:edit, :admin, @wing])
        click_link 'Room Management'
        current_url.should == url_for([:admin, @wing, :rooms])
        click_link 'Room 1'
        current_url.should == url_for([:edit, :admin, @wing, @room])
        click_link '2 Patients'

        @room.patients.count.should == 2
      end
    end
  end
end
