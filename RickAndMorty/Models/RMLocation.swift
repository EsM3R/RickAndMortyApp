//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Mehmet Vural on 25.02.2024.
//

import Foundation


struct RMCharacter: Codable {
    let id: Int?
    let name : String?
    let type : String?
    let dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
