require 'spec_helper'

describe Wing do
  before do
    @wing = FactoryGirl.create :wing, amount_of_rooms: 0
  end

  it 'adds rooms' do
    @wing.rooms.count.should == 0
    
    @wing.update_rooms(10)
    @wing.reload
    @wing.rooms.count.should == 10
  end

  context 'with multiple rooms' do
    before do
      @wing = FactoryGirl.create :wing, amount_of_rooms: 0
      @wing.update_rooms(10)
      @wing.reload
      @wing.update_attribute('amount_of_rooms', 10)
      @wing.reload
    end

    it 'removes rooms' do
      @wing.rooms.count.should == 10

      @wing.update_rooms(5)
      @wing.reload
      @wing.rooms.count.should == 5
    end
  end
end
