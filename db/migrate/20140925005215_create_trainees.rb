class CreateTrainees < ActiveRecord::Migration
  def change
    create_table :trainees do |t|
      t.text :name
      t.text :umid
      t.text :phone
      t.text :email
      t.text :status
      t.text :dept
      t.text :experience
      t.text :referral
      t.text :interests
      t.text :statement
      t.text :stage1
      t.text :demotape
      t.text :stage2
      t.text :apprenticeship_freeform1
      t.text :apprenticeship_freeform2
      t.text :apprenticeship_specialty1
      t.text :apprenticeship_specialty2
      t.text :broadcasters_exam

      t.timestamps
    end
  end
end
