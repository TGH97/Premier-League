//  PlayerView.swift
//  Liverpool
//  Created by Abbe on 2022-11-26.
import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var playerManager: PlayerManager
    var teamname : String
    
    var body: some View {
        
        let index_ = playerManager.getIndex(Something: teamname)
        
        NavigationStack {
            List{
                Section{
                    HStack{
                        Text("\(index_)")

                        Text("Coach:").bold()
                        Spacer()
                        Text(" \(playerManager.players?.teams[index_].coach.name ?? " ")  ")
                    }
                }
                HStack{
                    Text("Players")
                        .bold().frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    Spacer()
                    Spacer()
                }
                ForEach((0...22), id: \.self){i in
                    HStack{
                        if playerManager.players?.teams.isEmpty == false {
                            Text("\(playerManager.players?.teams[index_].squad[i].name ?? " "  )  ")
                        }
                        Spacer()
                        
                        NavigationLink(destination: Oneplayer(squad: playerManager.players?.teams[index_].squad[i] ?? Squad(id: 2, name: "samir", position: Position.forward, dateOfBirth: "sa", nationality: "String") )
                        ) {
                        }
                    }
                }
            }
        }.onAppear {
            playerManager.getPlayers()
        }
    }
}
struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(teamname: "Liverpool")
            .environmentObject(PlayerManager())
    }
}
