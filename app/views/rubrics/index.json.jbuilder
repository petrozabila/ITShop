json.array!(@rubrics) do |rubric|
  json.extract! rubric, :id, :name, :body
  json.url rubric_url(rubric, format: :json)
end
