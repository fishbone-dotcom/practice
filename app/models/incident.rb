class Incident < ApplicationRecord
  belongs_to :organization
  belongs_to :user
end
