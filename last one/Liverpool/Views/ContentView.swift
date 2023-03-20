//  ContentView.swift
//  Liverpool
//  Created by Abbe on 2022-11-22.
import SwiftUI
import Foundation



struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false

    @StateObject var standingsManager = StandingsManager.shared
    
    @StateObject var favoritePlayerViewModel: FavoritePlayerViewModel = FavoritePlayerViewModel()

    @StateObject private var vm = ViewModel()
    
    @State private var showingRatingDialog = false
    @State private var rating = UserDefaults.standard.integer(forKey: "rating")
    @State private var userRating = UserDefaults.standard.dictionary(forKey: "userRating") as? [String: Int] ?? [:]
    
    private var averageRating: Double {
        let ratingsSum = userRating.reduce(0, { $0 + $1.value })
        let numberOfRatings = userRating.count
        return numberOfRatings > 0 ? Double(ratingsSum) / Double(numberOfRatings) : 0
    }
    
    private func saveRating(rating: Int) {
        UserDefaults.standard.set(rating, forKey: "rating")
        
        if let userId = UIDevice.current.identifierForVendor?.uuidString {
            userRating[userId] = rating
            UserDefaults.standard.set(userRating, forKey: "userRating")
        }
    }



    
    var body: some View {
        Spacer()
        HStack{
                         Toggle("Dark Mode", isOn: $isDarkMode)
                }

        
            /*VStack {
                Button("Toggle Favorites", action: vm.sortFavs)
                    .padding ()
                
                List {
                    Text(String(vm.filteredItems.count))
                    ForEach(vm.filteredItems) { item in
                       
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                            }
                            Spacer()
                            Image(systemName: vm.contains(item) ? "heart.fill" : "heart")
                                .foregroundColor(.Red)
                                .onTapGesture {
                                    vm.toggleFav(item: item)
                                }
                        }
                    }
                }
                .cornerRadius(10)
            }*/
            VStack{
                Text("EPL Standings").font(.system(size: 25)).bold()
            }
            NavigationStack {
                List{
                    HStack{
                        Text("Team")
                            .bold().frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        Spacer()
                        Spacer()
                        Text("Points")
                            .bold().frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                    }
                    
                    
                    
                    ForEach((0...19), id: \.self){i in
                        if standingsManager.standings.isEmpty == false {
                            HStack {
                                Text("\(standingsManager.standings[i].position)  ")
                                let url = URL(string: standingsManager.standings[i].squadLogo)
                                HStack {
                                    AsyncImage(url: url)
                                }
                                Text("\(standingsManager.standings[i].name)")
                                Spacer()
                                NavigationLink(destination: TeamStats(standings: standingsManager.standings[i])) {
                                }
                                Text("\(standingsManager.standings[i].points)")
                                
                            }
                            
                        }
                        
                    }
                }
            }.onAppear() {
                standingsManager.loadData()
                
            }
        }
    
   
    
    
        
       // PlayerView(teamname: "Liverpool")
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

