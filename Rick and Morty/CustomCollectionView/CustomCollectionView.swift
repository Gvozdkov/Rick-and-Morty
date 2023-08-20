//
//  CustomCollectionView.swift
//  Rick and Morty
//
//  Created by Алексей Гвоздков on 20.08.2023.
//

import UIKit

final class CustomCollectionView: UICollectionView {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 156, height: 210)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        
        super.init(frame: .zero, collectionViewLayout: layout)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .gray
        self.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
