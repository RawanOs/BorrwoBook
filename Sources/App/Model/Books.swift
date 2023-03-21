//
//  Books.swift
//  
//
//  Created by Rawan on 22/08/1444 AH.
//

import Foundation
import Fluent
import Vapor

final class Books: Model, Content {
    //table of db
    static let schema = "Books"

    //my proparity
    //ID from model protocol
    @ID(key: .id)
    var id: UUID?

    @Field(key:"title")
    var title: String

//    @Field(key:"Available")
//    var available: Bool

    @Field(key:"review")
    var review: Int
    
    @Field(key:"price")
    var price: Int
    
    @Children(for: \.$book)
    var BorrwoBooks: [BorrwoBook]
    
    
    //init for proparity
    init() {}

    init(id: UUID? = nil, title: String, review: Int, price:Int ){
        self.id = id
        self.title = title
//       self.available = available
        self.review = review
        self.price = price
    }
}
