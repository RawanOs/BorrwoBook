import Vapor
import Fluent

func routes(_ app: Application) throws {
    
    app.group("Book") { book in
        
     book.get("getbook") { req in
       Books(id: UUID(),title: "bookname")
     }

     book.post("postbook", ":id")  { req -> String in
         let id = req.parameters.get("id")!
        return "Post book , \(id)"
     }
        
     book.post("postbook")  { req -> Books in
//            let book = Books(id: UUID(),title: "bookname")
//            print(book)
            return try req.content.decode(Books.self)
        }

     }
    
    
    
    //register between route and controller
    //controller
     try app.register(collection: BooksController())
     let BooksController = BooksController()
    
    //Function
     app.post("lists", use: BooksController.create)
     app.get("lists", use: BooksController.readAll)
     //(routes,function)
}

