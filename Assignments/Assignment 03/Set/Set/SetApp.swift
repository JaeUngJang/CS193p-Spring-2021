//
//  SetApp.swift
//  Set
//
//  Created by JaeUngJang on 2023/05/28.
//

import SwiftUI

@main
struct SetApp: App {
    
    private let setGame = SetGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            SetGameView(game: setGame)
        }
    }
}
