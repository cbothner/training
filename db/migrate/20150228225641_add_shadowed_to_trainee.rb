class AddShadowedToTrainee < ActiveRecord::Migration
  def change
    add_column :trainees, :shadowed, :boolean
  end
end
