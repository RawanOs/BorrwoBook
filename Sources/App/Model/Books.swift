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
//my table
// content "conferm for content"

//decoding , schema for psql
final class Books: Model, Content {
    //table of db
    static let schema = "Books"

    //my proparity
    @ID(key: .id)
    var id: UUID?

    @Field(key:"title")
    var title: String

    
    
    //init for proparity
    init() {}

    init(id: UUID? = nil, title: String){
        self.id = id
        self.title = title
    }
}
