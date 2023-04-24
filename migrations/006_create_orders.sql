Create table if not exists orders (
    id Serial primary key,
    d_id INT not null,
    time INT not null,
    user_id INT not null,
    is_delivered BOOLEAN not null,
    CONSTRAINT fk_user
      FOREIGN KEY(user_id) 
	  REFERENCES users(user_id),
    CONSTRAINT fk_dish
      FOREIGN KEY(d_id) 
	  REFERENCES dishes(dish_id)
)