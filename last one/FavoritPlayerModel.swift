//
//  FavoritPlayerModel.swift
//  Liverpool
//
//  Created by Abbe on 2022-12-08.
//

import Foundation

// Immutable Struct has only 'let' constants
struct FavoritPlayerModel: Identifiable, Codable {
    let id: String
    let playerName: String
    let isFavorite: Bool
    let playerInfo: Squad
    
    init(id: String = UUID().uuidString, playerName: String, isFavorite: Bool,playerInfo: Squad) {
        self.id = id
        self.playerName = playerName
        self.isFavorite = isFavorite
        self.playerInfo = playerInfo

    }
    
    func updateCompletion() -> FavoritPlayerModel {
        return FavoritPlayerModel(id: id, playerName: playerName, isFavorite: !isFavorite, playerInfo: playerInfo)
    }
    
}
