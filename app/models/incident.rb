class Incident < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :severity, presence: true, inclusion { in: %w[low medium high critical] }
  validates :status, presence: true, inclusion { in: %w[open investigating resolved] }
  validates :resolved_at_after_started_at

  private

  def resolved_at_after_started_at
    return if started_at.ni? || resolved_at.nil?

    raise "Must be after started_at" if resolved_at <= started_at
  end
end
