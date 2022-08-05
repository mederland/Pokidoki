//
//  NetworkManager.swift
//  Pokidoki
//
//  Created by Consultant on 7/14/22.
//

import Foundation

class NetworkManager {
    let session: URLSession
    init (session: URLSession = URLSession.shared) {
        self.session = session
    }
}

extension NetworkManager{
    func fetchPage(urlStr: String, completion: @escaping(Result<PokemonPage, Error>) -> Void) {
        guard let url = URL(string: urlStr) else {
            // completion error
            return
        }
        self.session.dataTask(with: url) { data, response, error in
            // Do error handling
            guard let data = data else {
                return
            }
            
            do {
                let page = try JSONDecoder().decode(PokemonPage.self, from: data)
                completion(.success(page))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    func fetchPage2(urlStr: String, completion: @escaping(Result<DetailPokemon, Error>) -> Void) {
        guard let url = URL(string: urlStr) else {
            // completion error
            return
        }
        self.session.dataTask(with: url) { data, response, error in
            // Do error handling
            guard let data = data else {
                return
            }
            
            do {
                let page = try JSONDecoder().decode(DetailPokemon.self, from: data)
                completion(.success(page))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchImageData(urlStr: String, completion: @escaping (Result<Data,Error>) -> Void) {
        guard let url = URL(string: urlStr) else {
            // completion error
            return
        }
        self.session.dataTask(with: url) { data, response, error in
            // Do error handling
            guard let data = data else {
                return
            }
                completion(.success(data))
        }.resume()
    }
}
