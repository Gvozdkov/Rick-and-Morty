//
//  ViewController.swift
//  Rick and Morty
//
//  Created by Алексей Гвоздков on 17.08.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    let collectionView = CustomCollectionView()
    
    let cellData = [
        (image: UIImage(named: "Rick Sanchez"), label: "Rick Sanchez"),
        (image: UIImage(named: "Morty Smith"), label: "Morty Smith"),
        (image: UIImage(named: "Summer Smith"), label: "Summer Smith"),
        (image: UIImage(named: "Beth Smith"), label: "Beth Smith"),
        (image: UIImage(named: "Rick Sanchez"), label: "Rick Sanchez"),
        (image: UIImage(named: "Morty Smith"), label: "Morty Smith"),
        (image: UIImage(named: "Summer Smith"), label: "Summer Smith"),
        (image: UIImage(named: "Beth Smith"), label: "Beth Smith")
    ]
    
    private lazy var labelCharacters: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 150, height: 10)
        label.text = "Characters"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        settingsViewController()
    
    }
    
    private func settingsViewController() {
        
        view.backgroundColor = .darkBlue
        view.addSubview(labelCharacters)
        view.addSubview(collectionView)
        
        labelCharacters.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            labelCharacters.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelCharacters.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
}

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell else {
            print("CustomCell Error")
            return UICollectionViewCell()
        }
        
        let data = cellData[indexPath.item]
        cell.imageView.image = data.image
        cell.titleLabel.text = data.label
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedData = cellData[indexPath.item]

        if selectedData.label == "Rick Sanchez" {
            APIimageView = UIImage(named: "Rick Sanchez")
            APILabel = "Rick Sanchez"
            APIRequest = APIConstants.rickSanchez
        } else if selectedData.label == "Morty Smith" {
            APIimageView = UIImage(named: "Morty Smith")
            APILabel = "Morty Smith"
            APIRequest = APIConstants.mortySmith
        } else if selectedData.label == "Summer Smith" {
            APIimageView = UIImage(named: "Summer Smith")
            APILabel = "Summer Smith"
            APIRequest = APIConstants.summerSmith
        } else if selectedData.label == "Beth Smith" {
            APIimageView = UIImage(named: "Beth Smith")
            APILabel = "Beth Smith"
            APIRequest = APIConstants.bethSmith
        }
        
        
        
        performSegue(withIdentifier: "CharacteristicsViewController", sender: selectedData)
    }
}
