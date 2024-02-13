//
//  CardView.swift
//  Squad2GoRomancing
//
//  Created by Keith Staines on 12/02/2024.
//

import SwiftUI

struct CardDetailView: View {
    
    @State private var detailOpacity = 0.0
    
    let width = CGFloat(300)
    let height = CGFloat(500)
    let card: Romancing
    
    var source: String {
        switch card.source {
        case .yes(let name):
            return name
        case .no:
            return "Anon"
        }
    }
    
    var body: some View {
        ZStack {
            ForEach(0..<10) { i in
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .rotationEffect(Angle(degrees: Double.random(in: 0..<360)))
                    .scaleEffect(CGSize(width: Double.random(in: 0.5..<1.5), height: Double.random(in: 0.5..<1.5)))
                    .offset(
                    CGSize(
                        width: CGFloat.random(in: (-UIScreen.main.bounds.width/2...UIScreen.main.bounds.width/2)),
                        height: CGFloat.random(in: (-UIScreen.main.bounds.height/2...UIScreen.main.bounds.height/2))
                    )
                )
            }
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.black.opacity(0.4))
                .frame(width: width, height: height)
            VStack(alignment: .leading, spacing: 12) {
                Text(card.quote)
                    .font(.system(size: detailOpacity == 0 ? 24 : 12))
                    .italic()
                    .bold()
                    .padding(.bottom)
                
                Group {
                    Text("[\(card.context)]")
                    Text("\(card.genre.verb) ") + Text("\(card.whoSaidIt ?? "")").italic()
                    Text("To: ") + Text("\(card.toWhom ?? "")").italic()
                    Text("Type: \(card.genre.rawValue)")
                    Text("Title: \(card.title)")
                    Text("Author: \(card.author ?? "")")
                    Text("Year: \(card.year ?? "")")
                    Text("Thank you, \(source)!")
                }
                .opacity(detailOpacity)
                Button("Reveal details") {
                    withAnimation(.easeInOut(duration: 2)) {
                        detailOpacity = 1.0
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(height: 40)
                .buttonStyle(.bordered)
                .tint(.blue)
                .opacity(1.0 - detailOpacity)
                .disabled(detailOpacity == 1)

            }
            .foregroundColor(.white)
            .padding()
            .frame(width: width)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
    
}
