//
//  Romancing.swift
//  Squad2GoRomancing
//
//  Created by Keith Staines on 12/02/2024.
//

import Foundation
import SwiftUI

var romancings: Set<Romancing> = [

    Romancing(
        quote: "Very well, I will marry you if you promise not to make me eat eggplant.",
        context: "Fermina, accepting Florentino's marriage proposal.",
        whoSaidIt: "Fermina",
        toWhom: "Florentino",
        title: "Love in the Time of Cholera",
        genre: .book,
        source: .yes("Kieran Pringle"),
        author: "Gabriel García Márquez",
        year: "1985"
    ),
    
    Romancing(
        quote: "I know now why you cry",
        context: "The T-800 Terminator, wiping a tear from the young John Connor's cheek",
        whoSaidIt: "Arnold Schwarzenegger, as the T-800",
        toWhom: "Edward Furlong, as the young John Connor",
        title: "Terminator 2: Judgement Day",
        genre: .film,
        source: .yes("Anon Emus"),
        author: nil,
        year: "1982"
    ),
    
    Romancing(
        quote: "I've seen things you people wouldn't believe. Attack ships on fire off the shoulder of Orion. I watched C-beams glitter in the dark near the Tannhauser gate. All those moments will be lost in time... like tears in rain...",
        context: "The dying Batty, after he spares Deckard's life",
        whoSaidIt: "Rutger Hauer, as Batty",
        toWhom: "Harrison Ford, as Deckard",
        title: "Blade Runner",
        genre: .film,
        source: .yes("Anon Emus"),
        author: "Adapted from Philip K. Dick's 'Do Androids Dream of Electric Sheep?'",
        year: "1991"
    ),
    
    Romancing(
        quote: "Of all the gin joints in all the towns in all the world, she walks into mine.",
        context: "Rick Blaine, startled as Ilsa Lund, his old flame, walks into his bar",
        whoSaidIt: "Humphrey Bogart as Rick Blaine",
        toWhom: "nobody in particular",
        title: "Casablanca",
        genre: .film,
        source: .yes("Keith S"),
        author: nil,
        year: "1942"
    ),
    
    Romancing(
        quote: "Who had a romantic first date in a thunderstorm and got hit by lightning (among many other things?)",
        context: "Wall-E, after reviving Eve with solar energy",
        whoSaidIt: nil,
        toWhom: nil,
        title: "Wall-E",
        genre: .film,
        source: .yes("Anon Emus"),
        author: "",
        year: "2008"
    ),
    
    Romancing(
        quote: "You're the first, the last, my everything",
        context: "First dance from our wedding. Which was a mistake. The song choice, not the wedding. Because it is a very difficult song to dance to. Particularly if you were born like me with no natural rhythm.",
        whoSaidIt: "Barry White",
        toWhom: nil,
        title: "Barry White, You're the First, the Last, my Everything",
        genre: .song,
        source: .yes("Steve R"),
        author: "",
        year: "1974"
    ),
    
    Romancing(
        quote: "We'll be together,\nwith the roof right over our head,\nwe'll share the shelter,\nof my single bed",
        context: "Bob Marley explains we'll be together no matter how little we have, and asks \"is this love?\"",
        whoSaidIt: "Bob Marley",
        toWhom: nil,
        title: "Is this love",
        genre: .song,
        source: .yes("Josh"),
        author: nil,
        year: "1978"
    )
    
]

/*

 */

struct Romancing: Identifiable {
    
    let id = UUID()
    let quote: String
    let context: String
    
    let whoSaidIt: String?
    let toWhom: String?
    let title: String
    let genre: Genre
    let source: Source
    let author: String?
    let year: String?
    
    var offset = Angle(degrees: 0)

}

extension Romancing: Hashable {
    enum Source {
        case yes(String)
        case no
    }
    
    enum Genre: String {
        case book = "Book"
        case film = "Film"
        case play = "Play"
        case poem = "Poem"
        case song = "Song"
        
        var verb: String {
            switch self {
                
            case .book:
                "Said by:"
            case .film:
                "Said by:"
            case .play:
                "Said by:"
            case .poem:
                "Written by:"
            case .song:
                "Sung by:"
            }
        }
    }
    
    static func == (lhs: Romancing, rhs: Romancing) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


