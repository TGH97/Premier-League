//
//  ViewModel.swift
//  Liverpool
//
//  Created by Talal Ghalioun on 2022-12-07.
//

import Foundation
import SwiftUI


extension ContentView {
    final class ViewModel: ObservableObject {
        
        
        var items:[Item] = []
        @ObservedObject var standingMananger = StandingsManager.shared
        @Published var showingFavs = false
        @Published var savedItems: Set<Int> = [1, 7]
        
        // Filter saved items
        var filteredItems: [Item]  {
            if showingFavs {
                return standingMananger.items.filter { savedItems.contains($0.id) }
            }
            return items
        }
        
        private var db = Database()
        
        init() {
            standingMananger.loadData()
            self.savedItems = db.load()
            self.items = standingMananger.items
            print(standingMananger.items.count)
        }
        
        func sortFavs() {
            withAnimation() {
                showingFavs.toggle()
            }
        }
        
        func contains(_ item: Item) -> Bool {
                savedItems.contains(item.id)
            }
        
        // Toggle saved items
        func toggleFav(item: Item) {
            if contains(item) {
                savedItems.remove(item.id)
            } else {
                savedItems.insert(item.id)
            }
            db.save(items: savedItems)
        }
    }
}

