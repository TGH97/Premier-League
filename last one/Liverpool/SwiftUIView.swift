//
//  SwiftUIView.swift
//  Liverpool
//
//  Created by Abbe on 2022-11-22.
//
/*
import Foundation
import SwiftUI
import Combine
 
struct PokemonAPIList: Decodable {
    var results: [PokemonListEntry]
}

/*struct PokemonListEntry: Decodable {
    var name: String
    var url: String
}*/

struct PokemonListEntry: Decodable{
    let team: Team
    let stats: Stats
    
struct Stats: Decodable{
        var gamesPlayed: Int
        var points: Int
        var rank: Int
        var goalDifference: Int
    }
    
    struct Team: Decodable{
        var name: String
        var logo: String
    }
}

 
class PokemonNetworkManager: ObservableObject {
  
   @Published var results = [PokemonListEntry] = []
     
    init() {
        /*guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(PokemonAPIList.self, from: data)
            
            DispatchQueue.main.async {
                self.results = pokemonList.results
            }
        }.resume()*/
        let token = "5841e14c99msh0cf73a16035d660p17030bjsnc6ff3f4002d7"  // <--- here your api key
        
        guard let url = URL(string: "https://premier-league-standings1.p.rapidapi.com/") else {
            print("Invalid URL")
            return
            
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("\(token)", forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("premier-league-standings1.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("self.results")
                return }
            DispatchQueue.main.async {
                do {
                    if let results = try JSONDecoder().decode(PokemonAPIList?.self, from: data){
                        
                        //self.results = results
                        self.results = results
                        
                        print("self.results")
                    }
                } catch {
                    print(error) // <-- here important
                }
            }
        }.resume()
    }
}
  
struct ContentVieww: View {
    @ObservedObject var networkingManager = PokemonNetworkManager()
    
    var body: some View {
       /* List(networkingManager.results,id:\.name) {pokemon in
            Text(pokemon.name)
                .font(.largeTitle)
        }*/
    }
}
*/
