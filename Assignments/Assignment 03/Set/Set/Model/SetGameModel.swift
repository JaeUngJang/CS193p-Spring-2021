//
//  SetGameModel.swift
//  Set
//
//  Created by JaeUngJang on 2023/05/28.
//

import Foundation

struct SetGameModel<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    init(numberOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        
        for index in 0..<numberOfCards {
            let content = createCardContent(index)
            cards.append(Card(content: content, id: index))
        }
    }
    
    
    struct Card: Identifiable {
        var isSelected: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
