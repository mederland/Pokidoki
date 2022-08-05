
//  PokemonPage.swift
//  Pokidoki
//  Created by Consultant on 7/14/22.

import Foundation

struct PokemonPage: Decodable {
    let count: Int
    let next: String
    let results: [Pokemon]
}
struct Pokemon: Decodable {
    let name: String
    let url: String
    //static var samplePokemon = Pokemon(id: 1, name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/\(1)")
}

