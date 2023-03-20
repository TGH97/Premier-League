//
//  TeamStats.swift
//  Liverpool
//
//  Created by Abbe on 2022-11-25.
//

import SwiftUI



struct TeamStats: View {
    
    
    var standings: Standings
    
    var body: some View {
        VStack {
            
            HStack{

                Text("\(standings.name)")
                    .font(.largeTitle)
                let url = URL(string: standings.squadLogo)                
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
            }
                VStack {
                    NavigationLink(destination: PlayerView(teamname: standings.name)) {
                        Text("Player List")
                            .font(.system(size: 30))
                    }
                    RowView(title: "Games played: \(standings.played)")
                    RowView(title: "Poinst: \(standings.points)")
                    RowView(title: "Wins: \(standings.winned)")
                    RowView(title: "Losses: \(standings.loosed)")
                    RowView(title: "Draws: \(standings.tie)")
                    RowView(title: "GoalDiff: \(standings.goalDifference)")
                }.padding()
            }
        }
    }
