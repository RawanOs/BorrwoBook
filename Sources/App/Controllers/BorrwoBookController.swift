//
//  File.swift
//  
//
//  Created by Rawan on 24/08/1444 AH.
//

//import Foundation
//import Vapor
//import Fluent
//
//struct BorrwoBookController: RouteCollection {
//    func boot(routes: Vapor.RoutesBuilder) throws {
//        let BorrwoBooks = routes.grouped("BorrwoBooks")
//        BorrwoBooks.get(use: readAll)
//        BorrwoBooks.get(use: readRecords)
////        Books.post(use: create)
////        Books.post(use: Update)
////        readAll(use: Update)
//
//    }
//
//
//    //create new records
//    func create(req: Request) async throws -> EventLoopFuture<BorrwoBooks> {
//        let BorrwoBooks = try req.content.decode(BorrwoBooks.self)
//        return BorrwoBooks.create(on: req.db).map { BorrwoBooks }
//     }
////
////    func Update(req: Request) async throws -> String {
////     return "Update Item"
////     }
//
//     //Read All records
//     func readAll(req: Request) async throws -> [BorrwoBooks] {
//         let _ : [BorrwoBooks] = [BorrwoBooks(id: UUID(), name: "", review: 0)]
//         return try await BorrwoBooks.query(on: req.db).all()
//     }
//
//    //Read one records
//    func readRecords(req: Request) async throws -> BorrwoBooks {
//        let id = req.parameters.get("id")!
//        let BorrwoBooks: BorrwoBooks = BorrwoBooks(id: UUID(), name: "", review: 0)
//        return BorrwoBooks
//    }
//
//}
