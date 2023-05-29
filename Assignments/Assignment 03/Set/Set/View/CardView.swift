//
//  CardView.swift
//  Set
//
//  Created by JaeUngJang on 2023/05/29.
//

import SwiftUI

struct CardView: View {
    let card: SetGameViewModel.Card
    
    var body: some View {
        let rectShape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        
        // 여기서 typealias로 이름만 바꿔주는 거랑 let으로 선언해주는 것. 어떻게 다른 것인가
        let numberOfShapes = card.content.numberOfShapes
        let shape = card.content.shape
        let shade = card.content.shade
        let color = card.content.color
        
        GeometryReader { geometry in
            ZStack {
                rectShape.fill().foregroundColor(.white)
                rectShape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                
                VStack {
                    ForEach(0..<numberOfShapes, id: \.self) { i in
                        ZStack {
                            Image(systemName: "\(shape).fill")
                                .resizable()
                                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.2)
                                .opacity(shade == "solid" ? 1 : shade == "vague" ? 0.3 : 0)
                                .foregroundColor(stringToColor(color))
                            
                            Image(systemName: "\(shape)")
                                .resizable()
                                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.2)
                                .foregroundColor(stringToColor(color))
                        }
                    }
                }
            }
        }
    }
    
    private func stringToColor(_ string: String) -> Color {
        switch string {
        case "red" :
            return .red
        case "green" :
            return .green
        case "purple" :
            return .purple
        default :
            return .black
        }
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 15
        static let lineWidth: CGFloat = 3
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        let card = game.cards[0]
        CardView(card: card)
    }
}
