//
//  FlyingNote.swift
//  Squad2GoRomancing
//
//  Created by Keith Staines on 12/02/2024.
//

import SwiftUI

let colors: [Color] = [.pink, .yellow, .pink, .blue, .purple, .brown, .pink]


class FlyingNoteModel: ObservableObject, Identifiable {
    
    var id: UUID { card.id }
    let card: Romancing
    let direction: Double = {
        Bool.random() == true ? 1.0 : -1.0
    }()
    
    var t0: Double = Date.timeIntervalSinceReferenceDate
    
    var t: Double = 0 {
        didSet {

        }
    }
    
    let foregroundColor = colors.randomElement()
    
    func update() {
        let t = (Date.timeIntervalSinceReferenceDate - t0) * direction
        let x = r*(1+sin(speed*t)) * cos(speed*t + delta)
        let y = r * sin(speed*t + delta)
        offSet = CGSize(width: CGFloat(x), height: CGFloat(y))
    }
    
    @Published var offSet: CGSize = .zero
    
    let r = Double.random(in: 50...150)
    let delta: Double = Double.random(in: 0...360)
    let speed: Double = Double.random(in: 0.25...1.75)
    
    init(card: Romancing) {
        self.card = card
    }
}

struct FlyingNote: View {

    @ObservedObject var model: FlyingNoteModel

    var body: some View {
        VStack {
            Image(systemName: "giftcard.fill")
                .resizable()
                .frame(width: 40, height: 30)
                .background(.white)
                .foregroundColor(model.foregroundColor)
        }
        .offset(model.offSet)
    }
}
