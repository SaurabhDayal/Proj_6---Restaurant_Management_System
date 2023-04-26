use actix_web::{web::Data, App, HttpServer};
use dotenv::dotenv;
use sqlx;
use sqlx::{postgres::PgPoolOptions};

mod model;
mod services_user;
mod service_orders;
mod services_subadmin;
mod services_admin;
mod error;

use model::*;
use services_user::*;
use service_orders::*;
use services_subadmin::*;
use services_admin::*;
use error::*;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok();

    let database_url = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    
    let pool = Data::new(
        AppState {  
            db:
        PgPoolOptions::new()
            .max_connections(5)
            .connect(&database_url)
            .await
            .expect("Error building a connection pool")}
    );

    HttpServer::new(move || {

        App::new()
            .app_data(pool.clone())
            .service(register)
            .service(login)
            .service(logout)
            .service(add_address)

            .service(create_subadmin)
            .service(get_subadmin_list)

            .service(create_restaurant)
            .service(create_dish)
            .service(get_restaurant_by_user_id)
            .service(get_dish_by_user_id)
            .service(get_users_list)

            .service(get_restaurant_list)
            .service(get_dish_list)
            .service(get_distance)

            .service(add_order)
            .service(delete_order)
            .service(ok_order)
    })
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}
