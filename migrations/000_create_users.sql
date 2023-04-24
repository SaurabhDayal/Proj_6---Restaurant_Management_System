Create table if not exists users (
    user_id Serial primary key,
    user_name TEXT not null,
    user_password TEXT Not null,
    user_email TEXT not null,
    credit Int not null
)