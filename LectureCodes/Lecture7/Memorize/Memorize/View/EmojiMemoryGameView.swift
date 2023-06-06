//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by JaeUngJang on 2023/05/17.
//

import Foundation
import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
        
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 120-90))
                    .padding(5)
                    .opacity(0.5)
                
                // .animation의 위치는 중요함. (적용한 위치까지 적용되기 때문)
                // 적용되는 것은 값이 변화한 것 (ex, card.isMatched)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(.linear(duration: 1).repeatForever(autoreverses: false))
//                    .font(font(in: geometry.size))
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            // i) without extension
            // .modifier(Cardify(isFaceUp: card.isFaceUp))
            // ii) with extension
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 32
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}



















struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        // preview에서 카드 전면부 원이 잘 들어갔는지 확인하기 귀찮으니 그냥 첫 번째 카드를 뒤집어 놓는 거임
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
    }
}
