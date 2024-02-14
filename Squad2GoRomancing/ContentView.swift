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
    @State private var titleOpacity: CGFloat = 1
    
    @State var models = romancings.map { romancing in
        FlyingNoteModel(card: romancing)
    }
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Spacer()
                Text("Squad 2 Go Romancing at the Valentine Day Retro")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(.yellow)

                    .opacity(titleOpacity)
                    .animation(.easeOut, value: titleOpacity)
                Spacer()
                Image("RedRose")
                    .resizable()
                    .scaledToFit()
                    .offset(
                        CGSize(
                            width: 0.0,
                            height: 175 * (1.0 - titleOpacity)
                        )
                    )
                    .scaleEffect(
                        CGSize(
                            width: max(titleOpacity,0.5),
                            height: max(titleOpacity, 0.5)
                        )
                    )
                    .animation(
                        .easeOut,
                        value: titleOpacity
                    )
                Spacer()
            }
            
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
                .offset(
                    CGSize(
                        width: 0.0,
                        height: -190 * (1.0 - titleOpacity)
                    )
                )
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
                        titleOpacity = 0
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
             We are all out of romance ❤️
             """
        )
        .foregroundStyle(.pink)
        .padding()
        .padding(.vertical)
        .background(.white.opacity(0.8))
    }
    
    
}
