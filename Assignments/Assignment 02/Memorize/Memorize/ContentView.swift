//
//  ContentView.swift
//  Memorize
//
//  Created by JaeUngJang on 2023/05/17.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            
            VStack {
                currentThemeText
                scoreText
            }
            .padding()

            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.themeColor)
            .padding(.horizontal)
            
            newThemeButton
        }
    }
}


// MARK: - COMPONENTS

extension ContentView {
    
    private var currentThemeText: some View {
        Text("\(viewModel.themeName)")
            .font(.largeTitle)
    }
    
    private var scoreText: some View {
        Text("Score : \(viewModel.score)")
            .font(.body)
    }
    
    private var newThemeButton: some View {
        Button {
            viewModel.chooseTheme()
        } label: {
            Text("New Game")
                .font(.title)
        }
        .padding()
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}























// MARK: - PREVIEWS

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
