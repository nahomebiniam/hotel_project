require_relative "room"

class Hotel
    def initialize(name, capacities)
        @name = name
        @rooms = {}
        
        capacities.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        name_array = @name.split(" ")
        (0...name_array.length).each do |index|
            name_array[index] = name_array[index].capitalize
        end
        name_array.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        if @rooms.include?(room_name)
            return true
        end

        false
    end

    def check_in(person, room_name)
        if !self.room_exists?(room_name)
            puts "sorry, room does not exist"
        end

        if Room.add_occupant(person)
            puts "check in successful"
        end

        puts "sorry, room is full"
    end

    def has_vacancy?
    end
end
