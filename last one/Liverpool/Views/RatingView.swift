//
//  RatingView.swift
//  Liverpool
//
//  Created by Talal Ghalioun on 2023-03-17.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("How many stars would you give this app?")
                .font(.headline)
                .padding()
            
            Picker(selection: $rating, label: Text("")) {
                ForEach(1...5, id: \.self) { i in
                    Image(systemName: "star.fill")
                        .foregroundColor(i <= rating ? .yellow : .gray)
                        .tag(i)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            HStack {
                Button(action: { isPresented = false }) {
                    Text("Cancel")
                }
                .padding(.trailing)
                
                Button(action: { isPresented = false; saveRating(rating: rating) }) {
                    Text("OK")
                }
            }
            .padding()
        }
    }
    
    private func saveRating(rating: Int) {
        // Store the rating in UserDefaults or a database
        UserDefaults.standard.set(rating, forKey: "appRating")
    }
    
}
