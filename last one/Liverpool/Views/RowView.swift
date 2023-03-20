//
//  RowView.swift
//  Liverpool
//
//  Created by Abbe on 2022-11-26.
//

import SwiftUI

struct RowView: View {
    
    let title: String

    var body: some View {
        
        
        Section {
            Text(title)
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.blue)
            .foregroundColor(.white)
        }.cornerRadius(100)
        
    }

    }


struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(title: "samir")
    }
}
