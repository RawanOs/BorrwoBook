import Vapor
import FluentPostgresDriver
import Fluent

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    try routes(app)
    
    app.databases.use(
        .postgres(hostname: "localhost", username: "username", password: "vapor", database: "books"), as: .psql)
    
    
}
