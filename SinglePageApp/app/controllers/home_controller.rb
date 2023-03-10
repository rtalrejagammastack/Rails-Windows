class HomeController < ApplicationController
    def index
        @room = Room.find(1)
    end
end
