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
        @room.patients.count.should == 1
        visit url_for([:edit, :admin, @wing, @room])
        click_link '2 Patients'

        @room.patients.count.should == 2
        @room.patients.last.number.should == 2
      end
    end

    context 'diet management' do
      before do
        visit url_for([:admin])
      end

      it 'creates a diet' do
        Diet.count.should == 0
        click_link 'Diet Management'
        current_url.should == url_for([:admin, :diets])
        click_link 'Add a Diet'
        current_url.should == url_for([:new, :admin, :diet])

        fill_in 'Name', with: 'Diabetic'
        click_button 'Save'

        Diet.count.should == 1
        Diet.first.name.should == 'Diabetic'
      end

      context 'with a diet' do
        before do 
          @diet = FactoryGirl.create :diet
          visit url_for([:admin, :diets])
        end

        it 'edits a diet' do
          click_link 'Diabetic'

          current_path.should == edit_admin_diet_path(@diet)

          fill_in 'Name', with: 'Light Salt Diabetic'
          click_button 'Save'  

          @diet.reload
          @diet.name.should == 'Light Salt Diabetic'
        end

        it 'deletes a wing' do
          Diet.count.should == 1

          click_link 'Diabetic'
          current_path.should == edit_admin_diet_path(@diet)

          click_link 'Delete Diet'
          current_path.should == admin_diets_path

          Diet.count.should == 0
        end
      end
    end

    context 'food management' do
      before do
        visit url_for([:admin])
      end

      it 'creates a Food Item' do
        Food.count.should == 0
        click_link 'Food Management'
        current_url.should == url_for([:admin, :foods])
        click_link 'Add a Food'
        current_url.should == url_for([:new, :admin, :food])

        fill_in 'Name', with: 'Pizza'
        click_button 'Save'

        Food.count.should == 1
        Food.first.name.should == 'Pizza'
      end

      context 'with a Food Item' do
        before do 
          @food = FactoryGirl.create :food
          visit url_for([:admin, :foods])
        end

        it 'edits a diet' do
          click_link 'Pizza'

          current_path.should == edit_admin_food_path(@food)

          fill_in 'Name', with: 'Chicken Pizza'
          click_button 'Save'  

          @food.reload
          @food.name.should == 'Chicken Pizza'
        end

        it 'deletes a wing' do
          Food.count.should == 1

          click_link 'Pizza'
          current_path.should == edit_admin_food_path(@food)

          click_link 'Delete Food'
          current_path.should == admin_foods_path

          Food.count.should == 0
        end
      end
    end
  end
end
