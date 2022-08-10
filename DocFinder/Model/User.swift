//
//  User.swift
//  DocFinder
//
//

import Foundation


// Template of User Login API Resonse
struct UserLoginDetails:Codable  {
    let error: Bool
    let message: String
    let user: UserInformation
}

// User Information Template
struct UserInformation:Codable  {
    let name: String!
    let id: Int!
    let email: String!
}


