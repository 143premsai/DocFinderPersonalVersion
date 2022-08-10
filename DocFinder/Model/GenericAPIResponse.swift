//
//  GenericAPIResponse.swift
//  DocFinder
//
//  Created by user206624 on 8/4/22.
//

import Foundation

struct GenericApiResponse: Codable {
    let error: Bool
    let message: String
}
