class User < ApplicationRecord
    has_many :incident

    validates :name, presence: true
    validates :role, presence: true, inclusion: { in: %w[admin member] }
    validates :email, presence: true, uniqueness: { scope: :organization_id }
    validates :password, presence: true, length: { minimum: 8}
end
