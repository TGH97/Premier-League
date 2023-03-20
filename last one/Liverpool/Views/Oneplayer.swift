//  Oneplayer.swift
//  Liverpool
//  Created by Talal Ghalioun on 2022-11-28.
import SwiftUI

struct Oneplayer: View {
    @EnvironmentObject var playerManager: PlayerManager
   // @ObservedObject var favorites = FavoritePlayerViewModel()
    
    @EnvironmentObject var favoritePlayerViewModel: FavoritePlayerViewModel

    
    
    
    var squad: Squad
    var body: some View {
        Image("R")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300.0, height: 300.0, alignment: .center)
            .border(Color.blue, width: 3.0)
            .clipped()
        
        
        NavigationLink(destination: FavoritePlayersListView()) {
            Text("favorites")
                .font(.system(size: 30))
        }
        
        List{
            let newFavoritePlayer = FavoritPlayerModel(playerName: squad.name, isFavorite: true, playerInfo: squad )
            
            Button(action: {
                let indexPos = favoritePlayerViewModel.items.firstIndex(where: {$0.playerName == squad.name})
                if indexPos != nil {
                    favoritePlayerViewModel.items.remove(at: indexPos ?? 3)
                }else {
                    favoritePlayerViewModel.items.append(newFavoritePlayer)
                }

            },label: {
                
                let indexPos = favoritePlayerViewModel.items.firstIndex(where: {$0.playerName == squad.name})
                if indexPos != nil {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }else {
                    Image(systemName: "heart")
                        .foregroundColor(.gray)
                }
            }
            )
            
            
            VStack{
                
            
            
            
            HStack {
                Text("Player name: ")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                Text("\(squad.name)")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            }
            Spacer()
            HStack {
                Text("Day of birth: ")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                Text("\(squad.dateOfBirth)")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            }
            Spacer()
            HStack {
                Text("Nationality: ")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                Text("\(squad.nationality)")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            }
            Spacer()
            HStack{
                Text("Position: ")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                Text("\(squad.position?.rawValue ?? " ")")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            }
        }.padding()
        }
    }
}

struct Oneplayer_Previews: PreviewProvider {
    @State static var ahmad = Squad(id: 2, name: "samir", position: Position.forward, dateOfBirth: "sa", nationality: "String")
    static var previews: some View {
        Oneplayer(squad: ahmad)
    }
}
