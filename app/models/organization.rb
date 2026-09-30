class Organization < ApplicationRecord
    has_many :user
    has_many :incident
end
