//
//  MemorizeApp.swift
//  Memorize
//
//  Created by JaeUngJang on 2023/05/17.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
