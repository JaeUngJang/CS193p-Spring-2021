//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by JaeUngJang on 2023/05/17.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static var themes: [Theme] = [
        Theme(
            name: "Vehicle",
            emojis: ["🚂", "✈️", "🚲", "🚁", "🏎", "🚌", "🚍", "🚎", "🚐", "🚑", "🚒", "🚓", "🚔", "🚕", "🚖", "🚗", "🚙", "🚚", "🛻", "🛴", "🛵", "🏍", "🚜","🚞"],
            numberOfPairsOfCards: 5,
            cardColor: "red"
        ),
        Theme(
            name: "Food",
            emojis: ["🌭", "🌮", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🌽", "🥕", "🫒", "🧅", "🥔"],
            numberOfPairsOfCards: 10,
            cardColor: "yellow"
        ),
        Theme(
            name: "Face",
            emojis: ["😀", "😃", "😄", "😁", "😆", "🥹", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😝"],
            numberOfPairsOfCards: 15,
            cardColor: "purple"
        )
    ]
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in
            themes[0].emojis[pairIndex]
        }
    }
    
    @Published private var gameModel: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return gameModel.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        gameModel.choose(card)
    }
    
    
}
