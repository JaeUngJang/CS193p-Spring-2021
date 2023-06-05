//
//  SetGameModel.swift
//  Set
//
//  Created by JaeUngJang on 2023/05/28.
//

import Foundation

struct SetGameModel<Int, CardShape, CardShade, CardColor> where CardColor: Hashable, CardShade: Hashable, CardShape: Hashable {
    
    private(set) var cards: Array<Card>
    
    init(numberOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        
        for index in 0..<numberOfCards {
//            let content = createCardContent(index)
//            cards.append(Card(content: content, id: index))
        }
    }
    
    
    
    struct Card: Identifiable, Equatable {
        
        var isSelected: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int

        struct CardContent {
            let numberOfShapes: Int
            let shape: CardShape
            let shade: CardShade
            let color: CardColor
        }
        
        static func == (lhs: SetGameModel<Int, CardShape, CardShade, CardColor>.Card, rhs: SetGameModel<Int, CardShape, CardShade, CardColor>.Card) -> Bool {
            lhs.id == rhs.id
        }

    }
}
