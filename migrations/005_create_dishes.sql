Create table if not exists dishes (
    dish_id Serial primary key,
    dish_name TEXT not null,
    dish_cost Int not null,
    restaurant_id INT not null,
    user_id INT not null,
    time INT not null,
    CONSTRAINT fk_user
      FOREIGN KEY(user_id) 
	  REFERENCES users(user_id),
    CONSTRAINT fk_restaurant
      FOREIGN KEY(restaurant_id) 
	  REFERENCES restaurants(restaurant_id)
)