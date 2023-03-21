import Vapor
import Fluent

func routes(_ app: Application) throws {
    
    app.group("Book") { book in
        
        
        //get all books
        book.get("getbook") { req in
            Books.query(on: req.db).all()
            //            Books(id: UUID(),title: "bookname", available: "", review: 0, price: 0)
        }
        
        
        //get all Borrworbooks
        book.get("getBorrwobooks") { req in
            BorrwoBook.query(on: req.db).all()
            //            Books(id: UUID(),title: "bookname", available: "", review: 0, price: 0)
        }
        
        
        //get a specific book
        book.get("getbookid", ":id") { req -> EventLoopFuture<Books> in
            Books.find(req.parameters.get("id"), on: req.db).unwrap(or: Abort(.notFound))
            //E03B2E1D-306B-4645-9C01-98657F6E49C3
        }
        
        //get a specific Borrwobook
        book.get("getBorrwobooks", ":id") { req -> EventLoopFuture<BorrwoBook> in
            BorrwoBook.find(req.parameters.get("id"), on: req.db).unwrap(or: Abort(.notFound))
        }
        
        
        //add a specific book
        book.post("postbook")  {  req -> EventLoopFuture<Books> in
            let book = try req.content.decode(Books.self)
            return book.create(on: req.db).map{book}
        }
        
        //add a specific Borrwobooks
        book.post("postBorrwoBooks")  { req -> EventLoopFuture<BorrwoBook> in
            let BorrwoBook = try req.content.decode(BorrwoBook.self)
            return BorrwoBook.create(on: req.db).map{BorrwoBook}
        }
        
        //        book.post("postbook", ":id")  { req -> String in
        //            let id = req.parameters.get("id")!
        //            return "Post book , \(id)"
        //        }
        
        //        book.post("postbook")  { req -> Books in
        //            //            let book = Books(id: UUID(),title: "bookname")
        //            //            print(book)
        //            return try req.content.decode(Books.self)
        //        }
        
        
        //update specific book
        book.put("updatebook"){req -> EventLoopFuture<HTTPStatus> in
            let book = try req.content.decode(Books.self)
            return Books.find(book.id, on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap{
                    $0.title = book.title
                    $0.price = book.price
                    $0.review = book.review
    
                    return $0.update(on: req.db).transform(to: .ok)
                }
        }
        
        
        
        //update specific BorrwoBooks
        book.put("updateBorrwoBooks"){req -> EventLoopFuture<HTTPStatus> in
            let book = try req.content.decode(BorrwoBook.self)
            return BorrwoBook.find(book.id, on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap{
                    $0.name = book.name
                    $0.phone = book.phone
                    $0.numOfBooks = book.numOfBooks
    
                    return $0.update(on: req.db).transform(to: .ok)
                }
        }
        
        
        //delete specific book
        book.delete("deletebook", ":id"){ req -> EventLoopFuture<HTTPStatus> in
            Books.find(req.parameters.get("id"), on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap{
                    $0.delete(on: req.db)
                }.transform(to: .ok)
        }
        
        //delete specific BorrwoBooks
        book.delete("deleteBorrwoBooks", ":id"){ req -> EventLoopFuture<HTTPStatus> in
            BorrwoBook.find(req.parameters.get("id"), on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap{
                    $0.delete(on: req.db)
                }.transform(to: .ok)
        }
        
    }
    
    //register between route and controller
    //controller
//    try app.register(collection: BooksController())
//    let BooksController = BooksController()
//    
//    app.get("all", use: BooksController.readAll)
//    app.get(":id", use: BooksController.readRecords)
}

