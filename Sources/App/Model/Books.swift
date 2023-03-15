//
//  Books.swift
//  
//
//  Created by Rawan on 22/08/1444 AH.
//

import Foundation

import Fluent
import Vapor
//
final class Books: Model, Content {
    static let schema = "Books"

    @ID(key: .id)
    var id: UUID?

    @Field(key:"title")
    var title: String

    init() {}

    init(id: UUID? = nil, title: String){
        self.id = id
        self.title = title
    }
}
