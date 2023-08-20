//
//  CustomCell.swift
//  Rick and Morty
//
//  Created by Алексей Гвоздков on 20.08.2023.
//

import UIKit

final class CustomCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "Rick Sanchez")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.darkGray
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        
        constraintsSettingsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraintsSettingsView() {
        NSLayoutConstraint.activate([

            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 140),
            imageView.heightAnchor.constraint(equalToConstant: 140),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor) 
        ])
    }
}
