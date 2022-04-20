class Person < ApplicationRecord
    validates :name, presence: true
    validates :position, presence: true
    validates :age, presence: true
end
