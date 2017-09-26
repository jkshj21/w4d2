# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, presence:true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: 'Cat'


  def approve!

    CatRentalRequest.transaction do
      self.overlapping_pending_requests.each do |request|
        request.deny!
      end
      self.update!(status: "APPROVED")
    end
  end

  def deny!
    self.update!(status: 'DENIED')
  end

  def overlapping_requests
    CatRentalRequest
        .where(start_date: self.start_date..self.end_date)
        .or(CatRentalRequest.where(end_date: self.start_date..self.end_date))
        .or(CatRentalRequest.where('start_date < ? AND end_date > ?', self.start_date, self.end_date))
        .where(cat_id: self.cat_id)
        .where.not(id: self.id)
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: 'PENDING')
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def pending?
    self.status == 'PENDING'
  end

  def approved?
    self.status == 'APPROVED'
  end

  private

  def does_not_overlap_approved_request
    if !overlapping_approved_requests.empty?
      errors[:status] << 'There is already an approved request within those dates'
    end
  end


end
