require 'spec_helper'

describe 'Create a Wing' do
  before do
    visit admin_path
  end

  it 'creates wing' do
    Wing.count.should == 0

    click_link 'Room Management'
    current_path.should == admin_wings_path
    click_link 'Add a Wing'
    current_path.should == new_admin_wing_path
    fill_in 'Name', with: 'Saint Nicholas Wing'

    Wing.count.should == 1
    Wing.first.name.should == 'Sain Nicholas Wing'
  end
end
