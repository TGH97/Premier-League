//
//  LiverpoolApp.swift
//  Liverpool
//
//  Created by Abbe on 2022-11-22.
//

import SwiftUI

@main
struct LiverpoolApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
                    
           
    var playerManager = PlayerManager()
       @StateObject var favoritePlayerViewModel: FavoritePlayerViewModel = FavoritePlayerViewModel()


    var body: some Scene {
            WindowGroup {
                
                ContentView()
                    .environmentObject(playerManager)
                    .environmentObject(favoritePlayerViewModel)
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                
            }
        }
}

