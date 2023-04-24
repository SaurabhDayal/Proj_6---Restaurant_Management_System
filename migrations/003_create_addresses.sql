Create table if not exists addresses (
    address_id Serial primary key,
    address_name TEXT not null,
    address_lat float not null,
    address_lng float not null,
    user_id INT,
    CONSTRAINT fk_user
      FOREIGN KEY(user_id) 
	  REFERENCES users(user_id)
)