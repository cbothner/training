class Trainee < ActiveRecord::Base
  validates :name, :umid, :phone, :email, :status, presence: true
  validates :umid, numericality: { only_integer: true }, length: { is: 8 }
  validates :status, inclusion: { in: %w(student faculty alumnus community) }
  with_options if: :community? do |x|
    x.validates :statement, presence: true
  end

  def community?
    :status == "community"
  end
end
