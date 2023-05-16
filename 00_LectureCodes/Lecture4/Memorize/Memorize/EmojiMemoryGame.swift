//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by JaeUngJang on 2023/05/17.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis: [String] = ["🚂", "✈️", "🚲", "🚁", "🏎", "🚌", "🚍", "🚎", "🚐", "🚑", "🚒", "🚓", "🚔", "🚕", "🚖", "🚗", "🚙", "🚚", "🛻", "🛴", "🛵", "🏍", "🚜","🚞"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
