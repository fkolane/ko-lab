module RoomsHelper
    def room(id)
        Room.find(id)
    end
end
