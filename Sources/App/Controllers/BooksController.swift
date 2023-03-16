//
//  File.swift
//  
//
//  Created by Rawan on 22/08/1444 AH.
//

import Foundation
import Vapor
//import Fluent

struct BooksController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
//        let Books = routes.grouped("Books")
//        Books.get(use: index)
//        Books.post(use: create)
//        Books.post(use: Update)
//        readAll(use: Update)
         "register any new routes to."
    }

    
    //create new records
    func create(req: Request) async throws -> EventLoopFuture<Books> {
        let Books = try req.content.decode(Books.self)
        return Books.create(on: req.db).map { Books }
     }
    
    func Update(req: Request) async throws -> String {
     return "Update Item"
     }
    
     //Read All records
     func readAll(req: Request) async throws -> [Books] {
         let _: [Books] = [Books(title: "spider"),Books(title: "hh")]
         return try await Books.query(on: req.db).all()
     }
    
    
}
