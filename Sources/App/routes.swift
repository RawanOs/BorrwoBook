import Vapor
//import Fluent

func routes(_ app: Application) throws {

    
    app.group("Book") { book in
     // GET /plants
     book.get("getbook") { req in
         "Get all books"
     }
     // POST /plants
     book.post("postbook", ":id")  { req -> String in
         let id = req.parameters.get("id")!
        return "Post book , \(id)"
     }
     // GET /plants/:id
//     book.get(":id") { req in
//     let id = req.parameters.get("id")!
//         "Hello, world!"
//     }
     }
    
    
    
    //register between route and controller
     try app.register(collection: BooksController())
     let BooksController = BooksController()
     app.post("lists", use: BooksController.create)
     app.get("lists", use: BooksController.readAll)
     //(routes,function)
}


//try app.register(collection: BooksController())
//let BooksController = BooksController()
// app.post("lists", use: BooksController.create)
// app.get("lists", use: BooksController.readAll)
