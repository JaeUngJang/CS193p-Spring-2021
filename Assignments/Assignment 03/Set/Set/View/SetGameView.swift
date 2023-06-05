//
//  ContentView.swift
//  Set
//
//  Created by JaeUngJang on 2023/05/28.
//

import SwiftUI

struct SetGameView: View {
    
    @ObservedObject var game: SetGameViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                addCardsButton
                Spacer()
                newGameButton
                Spacer()
            }
            
            AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                        print("\(card)")
                    }
            }
        }
    }
}

extension SetGameView {
    private var addCardsButton: some View {
        Button {
            game.add()
        } label: {
            Text("Deal 3 More Cards")
        }
        
    }
    
    private var newGameButton: some View {
        Button {
            game.newGame()
        } label: {
            Text("New Game")
        }
    }
}



















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        SetGameView(game: game)
    }
}
