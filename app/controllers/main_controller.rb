class MainController < ApplicationController
    def index
        flash[:notice] = "You need to know about this :-|"
        flash[:alert] = "Summat didn't go well :-("
    end
end