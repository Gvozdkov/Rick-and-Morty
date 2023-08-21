//
//  CharacterAPIClient.swift
//  Rick and Morty
//
//  Created by Алексей Гвоздков on 20.08.2023.
//
import UIKit

protocol InfoAPIResponseDelegate: AnyObject {
    func didReceiveCharacterDetails(species: String, type: String, gender: String, planet: String)
    func didFailWithError(error: Error)
}

class InfoAPIClient {
    weak var delegate: InfoAPIResponseDelegate?

    func fetchCharacterDetails() {
        let urlString = "https://rickandmortyapi.com/api/character"

        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    self.delegate?.didFailWithError(error: error)
                    return
                }

                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

                        if let results = json?["results"] as? [[String: Any]], let firstCharacter = results.first {
                            if let species = firstCharacter["species"] as? String,
                               let gender = firstCharacter["gender"] as? String {
                                if let type = firstCharacter["type"] as? String {
                                    if let planet = firstCharacter["planet"] as? String {
                                
                                            self.delegate?.didReceiveCharacterDetails(species: species, type: type, gender: gender, planet: planet)
                                        } else {
                                            self.delegate?.didReceiveCharacterDetails(species: species, type: "None", gender: gender, planet: "Earth")
                                        }
                                    }
                                }
                            }
                        
                    } catch {
                        self.delegate?.didFailWithError(error: error)
                    }
                }
            }
            task.resume()
        }
    }
}

