//
//  CharacteristicsViewController.swift
//  Rick and Morty
//
//  Created by Алексей Гвоздков on 20.08.2023.
//

import UIKit

final class CharacteristicsViewController: UIViewController, InfoAPIResponseDelegate {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var labelStatus: UILabel!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var labelAnswerSpecies: UILabel!
    @IBOutlet var labelAnswerType: UILabel!
    @IBOutlet var labelAnswerGender: UILabel!
    @IBOutlet var labelAnswerPlanet: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = InfoAPIClient()
        client.delegate = self
        client.fetchCharacterDetails()
    }
    
    func didReceiveCharacterDetails(species: String, type: String, gender: String, planet: String) {

        DispatchQueue.main.async {
            self.nameLabel.text = APILabel
            self.imageView.image = APIimageView
            self.labelAnswerSpecies.text = species
            self.labelAnswerType.text = type
            self.labelAnswerGender.text = gender
            self.labelAnswerPlanet.text = planet
        }
    }
    
    func didFailWithError(error: Error) {
        print("Ошибка получения данных: \(error)")
    }
    
    @IBAction func actionButtonBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
