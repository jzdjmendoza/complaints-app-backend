json.complaint do |json|
  json.partial! 'complainants/complaints/complaint', complaint: @complaint
end