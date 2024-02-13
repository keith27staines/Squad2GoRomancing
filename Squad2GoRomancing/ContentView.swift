//
//  ContentView.swift
//  Squad2GoRomancing
//
//  Created by Keith Staines on 12/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pulsingAmount: CGFloat = 1
    @State private var card: Romancing?
    @State private var showFlyers = false
    @State private var showSorry = false
    
    @State var models = romancings.map { romancing in
        FlyingNoteModel(card: romancing)
    }
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.black
            
            if showFlyers {
                ForEach(models) { model in
                    FlyingNote(model: model)
                }
            }
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
                .background(.clear)
                .scaleEffect(pulsingAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .delay(0.2)
                    .repeatForever(autoreverses: true),
                    value: pulsingAmount)
                .onAppear {
                    pulsingAmount = 2
                }
                .onTapGesture {
                    if !showFlyers {
                        showFlyers = true
                        return
                    }
                    if romancings.isEmpty {
                        showSorry = true
                        return
                    }
                    guard let card = romancings.randomElement() else {
                        return
                    }
                    if romancings.contains(card) {
                        romancings.remove(card)
                        models.removeAll { model in
                            model.id == card.id
                        }
                    }
                    self.card = card
                }
            
            if showSorry {
                SorryView()
            }
        }
        .onReceive(timer) {_ in
            models.forEach { model in
                model.update()
            }
        }
        .sheet(item: $card) { card in
            CardDetailView(card: card)
                .presentationDetents([.large])
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

struct SorryView: View {
    var body: some View {
        Text("""
             That's all folks!
             We are all out of romance 👋
             """
        )
        .foregroundStyle(.pink)
        .padding()
        .background(.white.opacity(0.8))
    }
    
    
}
