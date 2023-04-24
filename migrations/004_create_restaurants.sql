Create table if not exists restaurants (
    restaurant_id Serial primary key,
    restaurant_name TEXT not null,
    restaurant_address INT not null,
    user_id INT not null,
    CONSTRAINT fk_user
      FOREIGN KEY(user_id) 
	  REFERENCES users(user_id),
    CONSTRAINT fk_address
      FOREIGN KEY(restaurant_address) 
	  REFERENCES addresses(address_id)
)