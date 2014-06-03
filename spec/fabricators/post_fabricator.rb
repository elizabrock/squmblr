Fabricator(:post) do
  user
end

Fabricator(:draft_post, from: :post) do
  published false
end

Fabricator(:published_post, from: :post) do
  published true
end
