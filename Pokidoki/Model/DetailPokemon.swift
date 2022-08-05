//
//  DetailPage.swift
//  Pokidoki
//
//  Created by Consultant on 7/18/22.
//

import Foundation

struct DetailPokemon: Decodable {
 
    let height: Int
    let weight: Int
    let types: [Ptype]
    let base_experience: Int
    let name : String

}
struct Ptype: Decodable{
    let type : Types
}

struct Types: Decodable {
    let name : String
}

