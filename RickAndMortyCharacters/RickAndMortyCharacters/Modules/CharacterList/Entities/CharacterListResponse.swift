//
//  CharacterListResponse.swift
//  RickAndMortyCharacters
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import Foundation

struct CharacterResponse: Codable {
    let results: [Characters]?
}

struct Characters: Codable {
    let name: String?
    let status: String?
    let species: String?
    let image: String?
}
