class Wing
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :amount_of_rooms, type: Integer, default: 0

  has_many :rooms

  def update_rooms(new_amount_of_rooms)
    if amount_of_rooms < new_amount_of_rooms
      add_rooms(new_amount_of_rooms - amount_of_rooms)
    end
  end

  def add_rooms(number_of_rooms_to_add)
    number_of_rooms_to_add.times do |index|
      self.rooms.create(number: index + 1)
      self.save!
    end
  end
end
