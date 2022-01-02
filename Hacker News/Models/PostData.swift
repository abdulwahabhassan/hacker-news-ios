//
//  PostData.swift
//  Hacker News
//
//  Created by Hassan Abdulwahab on 01/01/2022.
//

import Foundation

//Post and Results a struct have to conform to the Decodable protocol to be decoded from a json response

struct Results: Decodable {
    let hits: [Post]
}

//the identifiable protocol we adopt will allow our list to be able to identify the order of the post objects by their id
//for a struct to be identifiable it must have a property called id

struct Post: Decodable, Identifiable {
    var id: String { //computed property using the value of another property
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
