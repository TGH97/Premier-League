//
//  FavoritePlayersListView.swift
//  Liverpool
//
//  Created by Abbe on 2022-12-08.
//

import SwiftUI

struct FavoritePlayersListView: View {
    
    @EnvironmentObject var favoritePlayerViewModel: FavoritePlayerViewModel

    
    var body: some View {
        
        
        
        ZStack {
            if favoritePlayerViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                NavigationStack{
                    List {
                        ForEach(favoritePlayerViewModel.items) { item in
                            FavoriteListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        favoritePlayerViewModel.updateItem(item: item)
                                    }
                                }
                            
                                
                            
                        }
                        .onDelete(perform: favoritePlayerViewModel.deleteItem)
                        .onMove(perform: favoritePlayerViewModel.moveItem)
                    }
                    .listStyle(PlainListStyle())
                }
            }
        }
            .navigationTitle("Favorite Players")
            .navigationBarItems(
                leading: EditButton()
                )
        }
        
    }
/*

struct FavoritePlayersListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FavoritePlayersListView()
        }
        .environmentObject(FavoritePlayerViewModel())
    }
}

*/

