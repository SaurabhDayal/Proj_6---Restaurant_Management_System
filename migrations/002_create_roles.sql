Create table if not exists roles (
    role_id Serial primary key,
    role_type TEXT not null,
    user_id INT not null,
    CONSTRAINT fk_user
      FOREIGN KEY(user_id) 
	  REFERENCES users(user_id)
)