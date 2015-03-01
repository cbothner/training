json.array!(@trainees) do |trainee|
  json.extract! trainee, :id, :name, :umid, :phone, :email, :status, :dept, :experience, :referral, :interests, :statement, :stage1, :demotape, :stage2, :apprenticeship_freeform1, :apprenticeship_freeform2, :apprenticeship_specialty1, :apprenticeship_specialty2, :broadcasters_exam
  json.url trainee_url(trainee, format: :json)
end
