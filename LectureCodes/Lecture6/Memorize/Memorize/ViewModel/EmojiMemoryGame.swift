//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by JaeUngJang on 2023/05/17.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis: [String] = ["🚂", "✈️", "🚲", "🚁", "🏎", "🚌", "🚍", "🚎", "🚐", "🚑", "🚒", "🚓", "🚔", "🚕", "🚖", "🚗", "🚙", "🚚", "🛻", "🛴", "🛵", "🏍", "🚜","🚞"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            emojis[pairIndex]
        }
    }
    
//    @Published private var model: MemoryGame<String> = createMemoryGame()
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
