json.complaint do |json|
  json.partial! 'responders/complaints/complaint', complaint: @complaint
end