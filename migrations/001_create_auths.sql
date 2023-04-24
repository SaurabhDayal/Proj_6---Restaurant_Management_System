Create table if not exists auths (
    user_id INT not null,
    user_token TEXT not null,
    CONSTRAINT fk_user
      FOREIGN KEY(user_id) 
	  REFERENCES users(user_id)
)