//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by JaeUngJang on 2023/05/17.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
            CardView(card: card)
                .padding(4)
                // AspectVGrid에 aspectRatio를 주기 때문에 필요 없어짐
                //.aspectRatio(2/3, contentMode: .fit)
                .onTapGesture {
                    game.choose(card)
                }
        })
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
        
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 360-90))
                        .padding(5).opacity(0.5)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
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
