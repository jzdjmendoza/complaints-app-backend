json.(complaint, :id, :subject, :body, :city, :barangay, :status, :notes, :created_at, :updated_at)
json.responder complaint.responder_name
json.responder_status complaint.responder_status