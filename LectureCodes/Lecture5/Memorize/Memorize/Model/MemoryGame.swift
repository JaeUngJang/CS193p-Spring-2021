//
//  MemoryGame.swift
//  Memorize
//
//  Created by JaeUngJang on 2023/05/17.
//

import Foundation

// turning "don't cares" into "somewhat cares"
struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            // i) faceUpCardIndices를 찾는 방법
            //var faceUpCardIndices = [Int]()
            //for index in cards.indices {
            //    if cards[index].isFaceUp {
            //        faceUpCardIndices.append(index)
            //    }
            //}
            //
            // ii)
            //let faceUpCardIndices = cards.indices.filter( { index in cards[index].isFaceUp } )
            //Array (faceUpCardIndices)를 extension하고 oneAndOnly var를 만들어서 간소화
            //if self.count == 1 {
            //    return faceUpCardIndices.first
            //} else {
            //    return nil
            //}
            //
            // iii)
            // let faceUpCardIndices = cards.indices.filter({ cards[$0].isFaceUp })
            // return faceUpCardIndices.oneAndOnly
            
            // iv) 미리 선택되어 있는 카드: index
            //     선택되어있는 카드 없음 : nil
            cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly
        }
        set {
            //for index in cards.indices {
            //    // i)
            //    //if index != newValue {
            //    //    cards[index].isFaceUp = false
            //    //} else {
            //    //    cards[index].isFaceUp = true
            //    //}
            //
            //    // ii)
            //    cards[index].isFaceUp = (index == newValue)
            //}
            //
            // iii)
            //cards.indices.forEach( { index in cards[index].isFaceUp = (index == newValue) } )
            
            // iv)
            cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue)}
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
//        cards = Array<Card>()
        cards = []
        
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}


extension Array {
    var oneAndOnly: Element? {
        // indexOfTheOneAndOnlyFaceUpCard > set
        // 아래 코드를 oneAndOnly로 간소화 시킴
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
