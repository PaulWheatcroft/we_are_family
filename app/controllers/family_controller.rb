class FamilyController < ApplicationController
    def index
        @a_string_of_words = "Family is loaded"
        puts @a_string_of_words
    end

    def create
        @family_member = Person.new(params.permit(:name.downcase, :position.downcase, :age))
        @family_member.save
        puts "******** #{@family_member.name} "
        redirect_to family_path
    end

    def remove
        puts "***** delete *****"
        id = params[:id]
        @family_member = Person.find_by(id: id)
        @family_member.delete
        render :index
    end
end