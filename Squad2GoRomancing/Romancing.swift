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
        quote: "You should be kissed and often, and by someone who knows how.",
        context: "Rhett Butler in Gone With the Wind",
        whoSaidIt: "Rhett Butler",
        toWhom: "Scarlett O'Hara",
        title: "Gone With The Wind",
        genre: .book,
        source: .yes("Anon"),
        author: "Margaret Mitchell",
        year: "1936"
    ),
    
    Romancing(
        quote: "Oh, here's an idea: Let's make pictures of our internal organs and give them to other people we love on Valentine's Day. That's not weird at all.",
        context: " Jimmy Fallon - found via Good Housekeeping's top funny valentines day lines 😀",
        whoSaidIt: "Hopefully nobody ever",
        toWhom: nil,
        title: "",
        genre: .book,
        source: .yes("SamK"),
        author: "",
        year: ""
    ),

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
    ),
    
    Romancing(
        quote: "You had me at `hello'",
        context: "A romantic line said in the 1996 film Jerry Maguire (and a whole bunch of other places there isn't room to mention here!)",
        whoSaidIt: "Renée Zellweger, as Dorothy Boyd",
        toWhom: "Tom Cruise, as Jerry Maguire",
        title: "Jerry Maguire",
        genre: .film,
        source: .yes("Sara"),
        author: "",
        year: "1996"
    ),
    
    Romancing(
        quote: "Some people are worth melting for",
        context: "Olaf saves Anna from getting freeze",
        whoSaidIt: "Olaf",
        toWhom: "Anna",
        title: "Frozen",
        genre: .film,
        source: .yes("Anand"),
        author: "",
        year: "2013"
    ),
    
    Romancing(
        quote: "A true love story never ends",
        context: "From a Valentine's card (received this morning?)",
        whoSaidIt: "",
        toWhom: "",
        title: "",
        genre: .other,
        source: .yes("Kaustav"),
        author: "",
        year: ""
    ),
    
    Romancing(
        quote: "I fell in love the way you fall asleep: slowly, and then all at once",
        context: "In the book, Hazel and Augustus agree to read stories to each other. Hazel falls in love with him as he reads to her.",
        whoSaidIt: "Hazel Grace Lancaster",
        toWhom: "Augustus Waters",
        title: "The Fault in Our Stars",
        genre: .book,
        source: .yes("Sohel"),
        author: "John Green",
        year: "2012"
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
        case quote = "Quote"
        case other = "Other"
        
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
            case .quote:
                "Said by:"
            case .other:
                ""
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


