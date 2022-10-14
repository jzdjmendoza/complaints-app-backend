json.(user, :id, :email, :first_name, :last_name, :middle_name, :contact_number, :city, :barangay)
json.token user.generate_jwt