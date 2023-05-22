//
//  Theme.swift
//  Memorize
//
//  Created by JaeUngJang on 2023/05/17.
//

import Foundation

// Task 3
struct Theme {
    var name: String
    var emojis: [String]
    var numberOfPairsOfCards: Int?
    var cardColor: String
    
    init(name: String, emojis: [String], numberOfPairsOfCards: Int?, cardColor: String) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCards = numberOfPairsOfCards ?? Int.random(in: 4...emojis.count)
//        self.numberOfPairsOfCards = numberOfPairsOfCards > emojis.count ? emojis.count : numberOfPairsOfCards
        self.cardColor = cardColor
    }
}


