class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.boolean :active
      t.text :name
      t.text :phone
      t.text :email
      t.integer :weekday
      t.time :start
      t.time :end

      t.timestamps
    end
  end
end
