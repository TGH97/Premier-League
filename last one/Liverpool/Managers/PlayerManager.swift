//
//  PlayerManager.swift
//  Liverpool
//
//  Created by Abbe on 2022-11-26.
//

import Foundation

import SwiftUI

class PlayerManager: NSObject, ObservableObject {
    
    //@Published var players =  Players?.self
    @Published var players: Players?

    
    func getPlayers() {
        guard let url = URL(string: "https://api.football-data.org/v4/competitions/PL/teams") else { fatalError("Missing URL") }

        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("989499eed47242ca9569bd3cc49e2cec", forHTTPHeaderField: "X-Auth-Token")

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(Players.self, from: data)
                        self.players = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    func getIndex(Something: String) -> Int{
        var index = 99
        for i in 0...19 {
            
            if self.players?.teams[i].shortName == "Man City" {
                self.players?.teams[i].shortName = "Manchester City"
            }
            
            if self.players?.teams[i].shortName == "Man United" {
                self.players?.teams[i].shortName = "Manchester United"
            }
            
            if self.players?.teams[i].shortName == "Newcastle" {
                self.players?.teams[i].shortName = "Newcastle United"
            }
            if self.players?.teams[i].shortName == "Wolverhampton" {
                self.players?.teams[i].shortName = "Wolves"
            }
            if self.players?.teams[i].shortName == "Leicester City"{
                self.players?.teams[i].shortName = "Leicester"
            }
            if self.players?.teams[i].shortName == "Leeds United"{
                self.players?.teams[i].shortName = "Leeds"
            }
            if self.players?.teams[i].shortName == "Brighton Hove"{
                self.players?.teams[i].shortName = "Brighton"
            }
            
            if self.players?.teams[i].shortName == "Nottingham"{
                self.players?.teams[i].shortName = "Nottingham Forest"
            }
            
            
            if self.players?.teams[i].shortName == Something {
                index = i
            }
        }
        return index
    }
    
  
    
}





struct Players: Codable {
    let count: Int
    var teams: [Team]
}


struct Team: Codable {
    var name, shortName: String
    let squad: [Squad]
    let coach: Coach

}


struct Coach: Codable {
        let id: Int
        let firstName: String
        let lastName: String?
        let name, dateOfBirth, nationality: String
    }
    
struct Squad: Codable {
        let id: Int
        let name: String
        let position: Position?
        let dateOfBirth, nationality: String
      //  var isFavoritPlayer: Bool? = false

    }
 
  enum Position: String, Codable {
      case defence = "Defence"
      case forward = "Forward"
      case goalkeeper = "Goalkeeper"
      case midfield = "Midfield"
      case offence = "Offence"
  }
    



