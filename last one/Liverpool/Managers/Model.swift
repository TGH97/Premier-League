//
//  Model.swift
//  Liverpool
//
//  Created by Talal Ghalioun on 2022-12-07.
//

import Foundation


struct Item: Identifiable, Codable {
    
    var id: Int
    var title: String
    var isFaved: Bool
    
    static var sampleItems: [Item] {
        var temptList = [Item]()
        let standingsManager = StandingsManager.shared
        standingsManager.loadData()
       // standings = standingsManager.standings
        for i in 0...19 {
            let id = i
            if standingsManager.standings.isEmpty == true {
                //var title = "\(standingsManager.standings[i].name)"
                print("HEJJJJ")

            temptList.append(Item(id: id, title: "title", isFaved: false))
            }
        }
        return temptList
    }
    
}

