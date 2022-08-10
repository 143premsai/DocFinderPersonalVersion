//
//  DoctorInfo.swift
//  DocFinder
//
//  Created by user206624 on 8/5/22.
//

import Foundation


struct Doctor: Codable {
    let id: Int!
    let name: String!
    let address: String!
    let phone: String!
    let speciality: String!
    let city: String!
    let state: String!
    let latitude: Double!
    let longitude: Double!
}

struct DoctorDetails: Codable {
    let error: Bool
    let doctors: [Doctor]
    let message: String
}
