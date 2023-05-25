//
//  MemoryGame.swift
//  Memorize
//
//  Created by JaeUngJang on 2023/05/17.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private(set) var score = 0
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        
        // 1) 선택한 카드의 인덱스 받아오기
        // 2) 선택한 카드가 Face Down
        // 3) 선택한 카드가 Unmatched
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            // 선택된 카드가 한 장 있음 (한 장이 Face Up)
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                
                // 기존에 선택된 카드[potentialMatchIndex] == 새로 선택한 카드[chosenIndex]
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else { // 기존에 선택된 카드[potentialMatchIndex] != 새로 선택한 카드[chosenIndex] Task 15
                    if cards[chosenIndex].hasAlreadyBeenSeen || cards[potentialMatchIndex].hasAlreadyBeenSeen {
                        score -= 1
                    }
                }
                
                // 다시 Face Down 해놓기
                indexOfTheOneAndOnlyFaceUpCard = nil
                
            } else { // 선택된 카드가 없음
                
                // 모든 카드 탐색
                for index in cards.indices {
                    // 카드가 Face Up인 경우
                    // Face Down 시키고, hasBeenSeen 체크
                    if cards[index].isFaceUp {
                        cards[index].isFaceUp = false
                        cards[index].hasAlreadyBeenSeen = true
                    }
                }
                // Face Up 되어있는 카드를 chosenIndex로 업데이트
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            // 선택된 카드 Face Up
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle() // Task 13
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var hasAlreadyBeenSeen = false
        var content: CardContent
        var id: Int
    }
}


