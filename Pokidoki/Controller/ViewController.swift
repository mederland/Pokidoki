//
//  ViewController.swift
//  Pokidoki
//
//  Created by Consultant on 7/14/22.

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
   lazy var pokemonTable: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
       table.delegate = self
       table.backgroundColor = .white
       table.register(PokiTableViewCell.self, forCellReuseIdentifier: PokiTableViewCell.reuseId)
        return table
    }()
    var pokemons: [Pokemon] = []
    var Ptypes: [Ptype] = []
    var typeCache: [Int:String] = [:]
    let indeXM = 0
    let network: NetworkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setUpUI()
        
        self.view.backgroundColor = .white
        self.title = "POkiDoki"
        //Nachalo
            self.network.fetchPage(urlStr: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=151") { result in
            switch result {
            case .success(let page):
                print(page)
            self.pokemons = page.results
                DispatchQueue.main.async {
            self.pokemonTable.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        }
    private func setUpUI() {
        self.view.addSubview(self.pokemonTable)
        self.pokemonTable.bindToSuperview()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokiTableViewCell.reuseId, for: indexPath) as? PokiTableViewCell else {
        return UITableViewCell()
        }
        cell.configure(pokemon: self.pokemons[indexPath.row])
    self.network.fetchPage2(urlStr: "https://pokeapi.co/api/v2/pokemon/\(indexPath.row + 1)") { result in
        switch result {
        case .success(let page):
            self.Ptypes = page.types
            DispatchQueue.main.async { [self] in
                self.typeCache[indexPath.row] = self.Ptypes[0].type.name
                cell.configure(types: self.Ptypes[0])
            }
        case .failure(let error):
            print(error)
        }
    }
        
        
    DispatchQueue.global().asyncAfter (deadline: .now() + 2) {
        self.network.fetchImageData(urlStr: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(indexPath.row + 1).png")
    {result in
        switch result {
        case.success(let imageData):
            DispatchQueue.main.async {
                cell.pokeImageView.image = UIImage(data: imageData)
            }
        case.failure(let error):
            print(error)}
    }
    }
    return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
        detailVC.indexP = indexPath.row
    }
}

