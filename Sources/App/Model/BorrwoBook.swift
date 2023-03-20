//
//  File.swift
//  
//
//  Created by Rawan on 24/08/1444 AH.
//
import Fluent
import Vapor
import Foundation

final class BorrwoBooks: Model, Content {
    //table of db
    static let schema = "User"

    //my proparity
    @ID(key: .id)
    var id: UUID?

    @Field(key:"name")
    var name: String

    @Field(key:"phone")
    var phone: Int
    
    @Field(key:"numOfBooks")
    var numOfBooks: Int
    
//    @Field(key:"list of book")
//    var list: String
    
    //init for proparity
    init() {}

    init(id: UUID? = nil, name: String, phone: Int, numOfBooks: Int){
        self.id = id
        self.name = name
        self.phone = phone
        self.numOfBooks = numOfBooks
    }
}
