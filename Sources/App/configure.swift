import Vapor
import FluentPostgresDriver
import Fluent

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    try routes(app)
    
    //PostgeSQL Config
    app.databases.use(
        .postgres(hostname: "localhost",
                  username:"postgres",
                  password: "vapor",
                  database: "books"),
        as: .psql)
    
    
    //Migration Config
    app.migrations.add(CreatBook())
    app.migrations.add(CreatBorrwoBooks())
    app.migrations.add(AddIDCulumToBook())
}
