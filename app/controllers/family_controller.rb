class FamilyController < ApplicationController
    def index
        @a_string_of_words = "Family is loaded"
        puts @a_string_of_words
    end

    def create
        @family_member = Person.new(params.permit(:name, :position, :age))
        @family_member.save
        puts "******** #{@family_member.name} "
    end

    def delete
        puts "***** delete *****"
    end
end