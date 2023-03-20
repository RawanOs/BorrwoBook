//
//  CreatBook.swift
//  //fro cr
//
//  Created by Rawan on 22/08/1444 AH.
//

import Foundation
import Fluent
import Vapor
import FluentPostgresDriver
//my table "version control"
// prepare my table 

struct CreatBook: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
         database.schema("Books")
            .id()
            .field("title", .string)
//          .field("Available", .bool)
            .field("review", .int)
            .field("price", .int)
            .create()

    }

    func revert(on database: Database) -> EventLoopFuture<Void>{
        return database.schema("Books").delete()
    }

}
