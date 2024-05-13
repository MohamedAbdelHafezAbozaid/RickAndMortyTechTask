//
//  CharactersTableViewCell.swift
//
//
//  Created by mohamed ahmed on 12/05/2024.
//

import UIKit
import Kingfisher
import struct Commons.MainCharacter

class CharactersTableViewCell: UITableViewCell {
    let containerView: UIView = { 
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        view.layer.cornerRadius = 20
        return view
    }()
    
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let speciesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(characterImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(speciesLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            characterImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            characterImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            characterImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15),
            characterImageView.widthAnchor.constraint(equalToConstant: 90),
            characterImageView.heightAnchor.constraint(equalToConstant: 90),
            
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            speciesLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            speciesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            speciesLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
        ])
    }
    
    func configure(with character: MainCharacter) {
        if let url = URL(string: character.image) {
            characterImageView.kf.setImage(with: url)
        }
        nameLabel.text = character.name
        speciesLabel.text = character.species
    }
}
