json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :expires_at, :salary, :email
  json.url job_url(job, format: :json)
end
