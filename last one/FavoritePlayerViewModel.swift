//
//  FavoritePlayerViewModel.swift
//  Liverpool
//
//  Created by Abbe on 2022-12-08.
//

import Foundation


class FavoritePlayerViewModel: ObservableObject {
    
    @Published var items: [FavoritPlayerModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([FavoritPlayerModel].self, from: data)
        else { return }

        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(playerName: String) {
        let newItem = FavoritPlayerModel(playerName: playerName, isFavorite: false,playerInfo: Squad(id: 2, name: "samir", position: Position.forward, dateOfBirth: "sa", nationality: "String"))
        items.append(newItem)
    }
    
    func updateItem(item: FavoritPlayerModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    
    
   /* func getIndex(Something: String, items: [FavoritPlayerModel] ) -> Int{
        
        
        
        //   if let index = array.firstIndex(of: "Peaches")
        for i in items {
            if i.playerName == Something {
                return index(of: i.id)
            }
            return 1000
        }
    */
    }

