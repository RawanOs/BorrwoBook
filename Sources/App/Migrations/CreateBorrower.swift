//
//  File.swift
//  
//
//  Created by Rawan on 27/08/1444 AH.
//

import Foundation
import Fluent
import Vapor
import FluentPostgresDriver
//my table "version control"
// prepare my table

struct CreatBorrwoBooks: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
         database.schema("BorrwoBooks")
            .id()
            .field("name", .string)
            .field("phone", .int)
            .field("numOfBooks", .int)
            .create()

    }

    func revert(on database: Database) -> EventLoopFuture<Void>{
        return database.schema("BorrwoBooks").delete()
    }

}
