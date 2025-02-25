class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    if end_date < start_date
      errors.add(:end_date, "musi być późniejsza niż data początkowa")
    end
  end
end

