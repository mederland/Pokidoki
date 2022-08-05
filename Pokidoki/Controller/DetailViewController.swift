//
//  DetailViewController.swift
//  Pokidoki
//
//  Created by Consultant on 7/17/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var indexP = 0
    //static  let reuseID = "\(PokiTableViewCell.self)"

        lazy var pokeImageViewX: UIImageView = {
            let imageView = UIImageView(frame: .zero)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.backgroundColor = .systemGray
            imageView.image = UIImage(named: "Image")
            imageView.layer.masksToBounds = false
            imageView.backgroundColor = .white
            // imageView.layer.borderColor = .white
            imageView.layer.cornerRadius = 141
            imageView.clipsToBounds = true
            return imageView
            }()

        lazy var progLabel: UILabel = {
            let label = UILabel(frame: .zero)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 25)
            label.textAlignment = .center
            label.backgroundColor = .systemGray6
            return label
        }()

        lazy var progLabel2: UILabel = {
            let label = UILabel(frame: .zero)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 25)
            label.textAlignment = .center
            label.backgroundColor = .systemGray5
            return label
        }()

        lazy var progLabel3: UILabel = {
            let label = UILabel(frame: .zero)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 25)
            label.textAlignment = .center
            label.backgroundColor = .systemGray4
            return label
        }()
    
 let network = NetworkManager()
    var Hght: Int = 0
    var Wght: Int = 0
    var BExp: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.setUpUI()
        self.network.fetchImageData(urlStr: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(indexP + 1).png")
    {result in
        switch result {
        case.success(let imageData):
            DispatchQueue.main.async {
                self.pokeImageViewX.image = UIImage(data: imageData)
            }
        case.failure(let error):
            print(error)}
    }
        self.network.fetchPage2(urlStr: "https://pokeapi.co/api/v2/pokemon/\(indexP + 1)") { result in
            switch result {
            case .success(let page):
                //self.A = page.name
                self.Hght = page.height
                self.Wght = page.weight
                self.BExp = page.base_experience
                
                DispatchQueue.main.async { [self] in
                    //self.typeCache[indexPath.row] = self.Ptypes[0].type.name
                    //cell.configure(types: self.Ptypes[0])
                    self.progLabel.text = "Power: \(self.BExp)"
                    self.progLabel2.text = "Height: \(self.Hght)"
                    self.progLabel3.text = "Weight: \(self.Wght)"
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    private func setUpUI(){
        self.view.addSubview(self.pokeImageViewX)
        self.view.addSubview(self.progLabel)
        self.view.addSubview(self.progLabel2)
        self.view.addSubview(self.progLabel3)
            //self.backgroundColor = .systemRed
            let vStackView = UIStackView(frame: .zero)
            vStackView.translatesAutoresizingMaskIntoConstraints = false
            vStackView.spacing = 8
            vStackView.axis = .vertical
            vStackView.distribution = .fillEqually
            
            vStackView.addArrangedSubview(self.progLabel)
            vStackView.addArrangedSubview(self.progLabel2)
            vStackView.addArrangedSubview(self.progLabel3)
            
            let hStackView = UIStackView(frame: .zero)
            hStackView.translatesAutoresizingMaskIntoConstraints = false
            hStackView.spacing = 8
            hStackView.axis = .vertical
            
            hStackView.addArrangedSubview(self.pokeImageViewX)
            hStackView.addArrangedSubview(vStackView)
            
            self.pokeImageViewX.heightAnchor.constraint(equalToConstant: 200).isActive = true
            self.pokeImageViewX.widthAnchor.constraint(equalToConstant: 200).isActive = true
            
            self.view.addSubview(hStackView)
        hStackView.bindToSuperview()
        
        }
}
