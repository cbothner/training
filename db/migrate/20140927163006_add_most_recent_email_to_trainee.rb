class AddMostRecentEmailToTrainee < ActiveRecord::Migration
  def change
    add_column :trainees, :most_recent_email, :number
  end
end
