class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event 

  after_create :congrat_send

  def congrat_send
    AttendanceMailer.congrat_email(self).deliver_now
  end
end
