class AddMentorToTrainees < ActiveRecord::Migration
  def change
    add_reference :trainees, :mentor, index: true
  end
end
