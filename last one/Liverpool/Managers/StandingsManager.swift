//
//  StandingsManager.swift
//  Liverpool
//
//  Created by Abbe on 2022-11-22.
//

import Foundation
import SwiftUI

//a6e3163ea0msh758cf1617b93f65p1e1be5jsn9fa030e69799 ---- 205191d4e2msh53d5a33912be5eep14040ajsnface7b1d8b6f
//premier-league-standings1.p.rapidapi.com ---- football98.p.rapidapi.com


class StandingsManager: ObservableObject {
    
    @Published var standings: [Standings] = []
    @Published var items:[Item] = []
    
    private init() {
        
    }
    
    public static var shared = StandingsManager()
    
    public func loadData() {
        print("HEJ")
        let token = "205191d4e2msh53d5a33912be5eep14040ajsnface7b1d8b6f"  // <--- here your api key
        
        guard let url = URL(string: "https://football98.p.rapidapi.com/premierleague/table") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("\(token)", forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("football98.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("self.results")
                return }
            DispatchQueue.main.async {
                do {
                    if let results = try JSONDecoder().decode([Standings]?.self, from: data){
                        self.standings = results
                        //    self.items = self.sampleItems(standings: results)
                  //      print(self.items)
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    /*
    public func sampleItems (standings: [Standings]) -> [Item]{
        
        var temptList:[Item] = []
        
        for i in 0...19 {
            if !standings.isEmpty {
                var title = "\(standings[i].name)"
                print(title)
                temptList.append(Item(id: i, title: title, isFaved: false))
            }
        }
        return temptList
    }
    */
    /* static var sampleItems: [Item] {
     
     // var standings: [Standings] = []
     //var standingsManager = StandingsManager()
     loadData()
     // standings = standingsManager.standings
     for i in 0...19 {
     let id = i
     if standings.isEmpty == false {
     let title = "hello \(standings[i].name)"
     print("HEJJJJ")
     
     temptList.append(Item(id: id, title: "title", isFaved: false))
     }
     }
     return temptList
     }
     */
    
}

/*
struct samira {
    let position: [Standings]
    let isFavorit: Bool
}
*/


struct Standings: Codable {
    let position: String
    let squadLogo: String
    let name, points, played, winned: String
    let loosed, tie, goalDifference: String
    
    
    enum CodingKeys: String, CodingKey {
        case position = "Position"
        case squadLogo = "SquadLogo"
        case name = "Name"
        case points = "Points"
        case played = "Played"
        case winned = "Winned"
        case loosed = "Loosed"
        case tie = "Tie"
        case goalDifference = "Goal Difference"
        
    }
    
}





