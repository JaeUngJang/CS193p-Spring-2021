//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by JaeUngJang on 2023/05/17.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
     
    static var themes: [Theme] = [
        Theme(
            name: "Vehicle",
            emojis: ["🚂", "✈️", "🚲", "🚁", "🏎", "🚌", "🚍", "🚎", "🚐", "🚑", "🚒", "🚓", "🚔", "🚕", "🚖", "🚗", "🚙", "🚚", "🛻", "🛴", "🛵", "🏍", "🚜","🚞"],
            numberOfPairsOfCards: nil,
            cardColor: "red"
        ),
        Theme(
            name: "Food",
            emojis: ["🌭", "🌮", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🌽", "🥕", "🫒", "🧅", "🥔"],
            numberOfPairsOfCards: nil,
            cardColor: "yellow"
        ),
        Theme(
            name: "Face",
            emojis: ["😀", "😃", "😄", "😁", "😆", "🥹", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😝"],
            numberOfPairsOfCards: nil,
            cardColor: "purple"
        )
    ]
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards ?? theme.emojis.count) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    
    var themeColor: Color {
        switch theme.cardColor {
        case "red" :
            return .red
        case "green":
            return .green
        case "blue":
            return .blue
        case "orange":
            return .orange
        case "yellow":
            return .yellow
        case "purple":
            return .purple
        case "pink":
            return .pink
        default:
            return .black
        }
    }
    
    var themeName: String {
        return theme.name
    }
    
    var score: Int {
        return model.score
    }
    
    var numberOfPairs: Int {
        return theme.numberOfPairsOfCards!
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func chooseTheme() {
        theme = EmojiMemoryGame.themes.randomElement()! // Task 11
        theme.emojis.shuffle() // Task 5
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
