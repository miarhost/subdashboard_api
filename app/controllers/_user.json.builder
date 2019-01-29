json.(user, :id, :email, :onbase_id, :working_status, :salary)
json.token user.generate_jwt