use actix_web::{web, App, HttpServer};

fn config(cfg: &mut web::ServiceConfig) {
    cfg.service(web::resource("/").to(|| async { "Hello Nixers!\n" }));
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| App::new().configure(config))
        .bind("127.0.0.1:8080")?
        .run()
        .await
}

#[cfg(test)]
mod tests {
    use super::*;
    use actix_web::dev::Service;
    use actix_web::{http, test, App, Error};

    #[actix_rt::test]
    async fn test() -> Result<(), Error> {
        let mut app = test::init_service(App::new().configure(config)).await;

        let resp = app
            .call(test::TestRequest::get().uri("/").to_request())
            .await
            .unwrap();

        assert_eq!(resp.status(), http::StatusCode::OK);

        let body = match resp.response().body().as_ref() {
            Some(actix_web::body::Body::Bytes(bytes)) => bytes,
            _ => panic!("Response error"),
        };

        assert_eq!(body, "Hello Nixers!\n");

        Ok(())
    }
}
