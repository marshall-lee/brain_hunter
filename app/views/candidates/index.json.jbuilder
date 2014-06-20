json.array!(@candidates) do |candidate|
  json.extract! candidate, :id, :name, :email, :expected_salary, :status
  json.url candidate_url(candidate, format: :json)
end
