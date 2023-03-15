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
    
//    func index(req:Request) throws -> EventLoopFuture<[Books]> {
//        return Books.query(on: req.db).all()
//    }
    
    func create(req: Request) async throws -> String {
     return "Create New one"
     }
    
    func Update(req: Request) async throws -> String {
     return "Update Item"
     }
    
     //Read All records
     func readAll(req: Request) async throws -> String {
     return "This is plants world"
     }
    
    
}
