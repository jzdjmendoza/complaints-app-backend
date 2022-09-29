json.array!(@complaints) do |complaint|
  json.partial! 'complainants/complaints/complaint', complaint: complaint
end