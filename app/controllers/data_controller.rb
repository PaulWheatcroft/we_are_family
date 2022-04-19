class DataController < ApplicationController
    def index
        @a_string_of_words = "This is something in text"
        @everyone = Person.all.order("name ASC")
        @total_ages = 0
        for human in @everyone
            @total_ages += human.age
        end
    end
    def user
        @everyone = Person.all.order("name ASC")
        id = params[:id]
        @family_member = Person.find_by(id: id)
        puts "Clicked by #{@family_member.name}"
        flash[:notice] = "You submitted #{@family_member.name}!"
        redirect_to data_path
    end
end
