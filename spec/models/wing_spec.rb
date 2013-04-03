require 'spec_helper'

describe Wing do
  before do
    @wing = FactoryGirl.create :wing, amount_of_rooms: 0
  end

  it 'adds rooms' do
    @wing.rooms.count.should == 0
    
    @wing.update_rooms(10)
    @wing.update
    @wing.rooms.count.should == 10
  end
end
