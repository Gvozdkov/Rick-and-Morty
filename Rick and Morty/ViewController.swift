//
//  ViewController.swift
//  Rick and Morty
//
//  Created by Алексей Гвоздков on 17.08.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    let collectionView = CustomCollectionView()
    
    private let characterCardNumber = [1, 2, 3, 4, 5 , 6, 7, 8]
    
    private lazy var labelCharacters: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 150, height: 10)
        label.text = "Characters"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        settingsViewController()
        
    }
    
    private func settingsViewController() {
        
        view.backgroundColor = .gray
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 8
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
           cell.titleLabel.text = "Rick Sanchez"
           cell.imageView.backgroundColor = .lightGray // Just to visualize the image area
           return cell
       }
}

//extension ViewController: UICollectionViewDelegateFlowLayout {
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//            return 0
//        }
//}

//
//extension ViewController: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CollectionViewCell else {
//            print("Error: The dequeued cell is not an instance of CollectionViewCell.")
//            return UICollectionViewCell()
//        }
//
//        cell.titleLabel.text = "\(characterCardNumber[indexPath.row])"
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 8
//    }
//
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        var id: String
//
//        switch kind {
//        case UICollectionView.elementKindSectionFooter:
//            id = footerIdentifier
//        default:
//            id = ""
//        }
//
//        if let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: id, for: indexPath) as? SupplementaryView {
//            view.titleLabel.text = ""
//            return view
//        } else {
//            return UICollectionReusableView()
//        }
//    }
//}
//
//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        let indexPath = IndexPath(row: 0, section: section)
//        let footerView = self.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionFooter, at: indexPath)
//
//        return footerView.systemLayoutSizeFitting(CGSize(width: collectionView.frame.width,
//                                                                 height: UIView.layoutFittingExpandedSize.height),
//                                                          withHorizontalFittingPriority: .required,
//                                                          verticalFittingPriority: .fittingSizeLevel)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.width / 2, height: 50)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
//
