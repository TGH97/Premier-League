//
//  FavoriteListRowView.swift
//  Liverpool
//
//  Created by Abbe on 2022-12-08.
//

import SwiftUI


struct FavoriteListRowView: View {
    
    let item: FavoritPlayerModel
    
    var body: some View {
        HStack {
            
            Text(item.playerName)
            Spacer()
            NavigationLink(destination: Oneplayer(squad: item.playerInfo )){
                
            }

        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct FavoriteListRowView_Previews: PreviewProvider {
    
    static var item1 = FavoritPlayerModel(playerName: "Abodi Mofleh", isFavorite: true,playerInfo: Squad(id: 2, name: "samir", position: Position.forward, dateOfBirth: "sa", nationality: "String"))
    static var item2 = FavoritPlayerModel(playerName: "Talal Ghalioun ", isFavorite: false,playerInfo: Squad(id: 2, name: "samir", position: Position.forward, dateOfBirth: "sa", nationality: "String"))
    
    static var previews: some View {
        Group {
            FavoriteListRowView(item: item1)
            FavoriteListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
