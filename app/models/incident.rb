class Incident < ApplicationRecord
  belongs_to :organization

  validates :title, presence: true
  validates :description, presence: true
  validates :severity, presence: true,
    inclusion: { in: %w[low medium high critical] }
  validates :status, presence: true,
    inclusion: { in: %w[open investigating resolved] }

  validate :resolved_at_after_started_at

  private

  def resolved_at_after_started_at
    return if started_at.nil? || resolved_at.nil?

    if resolved_at <= started_at
      errors.add(:resolved_at, "must be after started_at")
    end
  end
end