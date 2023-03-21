//
//  File.swift
//  
//
//  Created by Rawan on 29/08/1444 AH.
//

import Foundation
import Foundation
import Fluent
import FluentPostgresDriver

struct AddIDCulumToBook: Migration {
func prepare(on database: FluentKit.Database) -> EventLoopFuture<Void> {
database.schema("BorrwoBooks")
.field("book_id", .uuid, .references("Books", "id"))
.update()
}

func revert(on database: FluentKit.Database) -> EventLoopFuture<Void> {
    database.schema("BorrwoBooks")
        .deleteField("book_id")
        .delete()
}
}
