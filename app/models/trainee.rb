class Trainee < ActiveRecord::Base
  validates :name, :phone, :email, :status, presence: true
  validates :umid, numericality: { only_integer: true }, length: { is: 8 }
  validates :status, inclusion: { in: %w(student faculty alumnus community) }
  with_options if: :community? do |x|
    x.validates :statement, presence: true
  end
  with_options if: :has_umid? do |x|
    x.validates :umid, presence: true
  end

  def self.to_contact(days_after)
    all.select{ |t| t.age >= days_after }
      .reject{ |t| !t.most_recent_email.nil? && t.most_recent_email >= days_after }
  end

  def age
    (Date.today - created_at.to_date).to_i
  end

  def um_id
    umid[0..3]+" "+umid[4..8]
  end

  def has_umid?
    status == "student"
  end

  def community?
    status == "community"
  end
end
