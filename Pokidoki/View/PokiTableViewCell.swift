//
//  PokiTableViewCell.swift
//  Pokidoki
//
//  Created by Consultant on 7/16/22.
//

import UIKit

class PokiTableViewCell: UITableViewCell {
    
    static let reuseId = "\(PokiTableViewCell.self)"
    
    lazy var pokeImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGray5
        imageView.image = UIImage(named: "Image")
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
        }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Pokemon Name"
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var overviewLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20)
        //label.font = UIFont.fontNames(forFamilyName: )
        label.text = "Pokemon Type"
        //label.textColor = .
        label.textAlignment = .right
        label.backgroundColor = .clear
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {

        
        let hStack = UIStackView(axis: .horizontal, spacing: 8, distribution: .fillProportionally)
        let vStack = UIStackView(axis: .vertical, spacing: 8, distribution: .fillProportionally)
        
        vStack.addArrangedSubview(self.titleLabel)
        vStack.addArrangedSubview(self.overviewLabel)
        
        hStack.addArrangedSubview(self.pokeImageView)
        hStack.addArrangedSubview(vStack)
        
        self.contentView.addSubview(hStack)
        hStack.bindToSuperview()
    }
    
    
    
    
    func configure(pokemon: Pokemon) {
        self.titleLabel.text = pokemon.name.capitalized
    }
    
    func configure(types: Ptype){
        //self.overviewLabel.textColor = .red
        self.overviewLabel.text = types.type.name.capitalized
    }
}

