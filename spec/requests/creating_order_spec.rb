require 'spec_helper'

describe 'Creating an Food Order' do
  before do
    @wing = FactoryGirl.create :wing
    visit root_path
  end

  it 'views the wings of the hospital' do
    current_path.should == root_path
    page.should have_content(@wing.name)
  end

  context 'with a wing with rooms' do
    before do
      @wing.amount_of_rooms = 10
      @wing.instantiate_rooms
    end

    it 'goes to the rooms route' do
      click_link @wing.name
      current_path.should == wing_rooms_path(@wing)
    end

    it 'views the rooms' do
      visit url_for([@wing, :rooms])
      page.should have_content(@wing.rooms.first.number)
    end

    context 'with a room with patients 'do
      before do
        @room = @wing.rooms.first
        @room.instantiate_patients(2)
        @room.reload
        @patient = @room.patients.first
        visit url_for([@wing, @room, :patients])
      end

      it 'selects a patient' do
        click_link '1'
        current_url.should == url_for([@wing, @room, @patient, :meals])
      end

      it 'selects a meal' do
        click_link '1'
        page.should have_content('Breakfast')
        click_link 'Breakfast'
        current_url.should == url_for([:edit, @wing, @room, @patient, @patient.meals.first])
      end

      context 'with a meal' do
        before do
          @meal = @patient.meals.create(type: 'Supper')
          @diet = @patient.diets.create
          @diet.foods << FactoryGirl.create(:food)
          visit url_for([:edit, @wing, @room, @patient, @meal])
          current_url.should == url_for([:edit, @wing, @room, @patient, @meal])
        end

        it 'adds food to a meal' do
          @meal.foods.count.should == 0
          click_link @patient.diets.first.foods.first.name 
          @meal.foods.count.should == 1
        end

        context 'with a meal with food' do 
          before do
            @meal.foods << FactoryGirl.create(:food)
          end

          it 'places an order' do 
            Order.count.should == 0
            click_link 'Place Order'
            Order.count.should == 1
            @meal.orders.count.should == 1
            click_link 'Place Order'
            Order.count.should_not == 2
            @meal.orders.count.should_not >=2
          end

          context 'with an order' do

          end
        end
      end
    end
  end
end
