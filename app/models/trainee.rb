class Trainee < ActiveRecord::Base
  validates :name, :umid, :phone, :email, :status, presence: true
  validates :umid, numericality: { only_integer: true }, length: { is: 8 }
  validates :status, inclusion: { in: %w(student faculty alumnus community) }
  with_options if: :community? do |x|
    x.validates :statement, presence: true
  end

  def self.to_contact(days_after)
    all.select{ |t| t.age >= days_after }
      .reject{ |t| !t.most_recent_email.nil? && t.most_recent_email >= days_after }
  end

  def age
    (Date.today - created_at.to_date).to_i
  end

  def community?
    :status == "community"
  end
end
