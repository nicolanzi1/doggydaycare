# == Schema Information
#
# Table name: dogs
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  house_id   :integer          not null
#
# Indexes
#
#  index_dogs_on_name  (name)
#
class Dog < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validate :check_name_length

    belongs_to :house,  # choice 1
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :House

    has_many :toys, # choice 2
        primary_key: :id,   #dog's id
        foreign_key: :dog_id,
        class_name: :Toy

    def check_name_length
        unless self.name.length >= 4
            errors[:name] << "is too short, must be longer than four or more characters."
        end
    end

    def self.lookup_name_in_ms(name)
        start = Time.now
        Dog.where(name: name)
        (Time.now - start) * 1000
    end
end
