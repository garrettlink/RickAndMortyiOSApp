//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Garrett Link on 2/12/23.
//

import Foundation

struct RMLocaiton: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
