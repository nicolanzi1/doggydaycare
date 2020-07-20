class House < ApplicationRecord

    has_many :dogs,
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :Dog

    # The long way
    # def toys
    #     toys = []

    #     # self.dogs or dogs
    #     dogs.each do |dog|
    #         toys.concat(dog.toys)
    #     end

    #     toys
    # end

    has_many :toys,
        through: :dogs, # a house association
        source: :toys   # a dog association
end