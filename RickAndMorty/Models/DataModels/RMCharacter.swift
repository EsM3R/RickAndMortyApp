//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Mehmet Vural on 25.02.2024.
//

import Foundation



struct RMCharacter : Codable{
    
    let id: Int
    let name : String
    let status : RMCharacterStatus
    let species : String
    let type: String
    let gender: String
    let origin : RMOrigin
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
}

