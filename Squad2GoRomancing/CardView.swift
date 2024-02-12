//
//  CardView.swift
//  Squad2GoRomancing
//
//  Created by Keith Staines on 12/02/2024.
//

import SwiftUI

struct CardDetailView: View {
    let card: Romancing
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 200, height: 300)
                .background(.pink)
        }
    }
    
}
