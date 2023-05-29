//
//  SetGameViewModel.swift
//  Set
//
//  Created by JaeUngJang on 2023/05/29.
//

import Foundation
import SwiftUI

class SetGameViewModel: ObservableObject {
    
    typealias CardFeature = FeatureModel.CardFeature
    typealias Card = SetGameModel<CardFeature>.Card
    
    static var numberOfCards = 12
    
    private static func createSetGameModel() -> SetGameModel<CardFeature> {
        SetGameModel<CardFeature>(numberOfCards: numberOfCards) { featureIndex in
            featureModel.features[featureIndex]
        }
    }
    
    @Published private var setModel = createSetGameModel()
    private static var featureModel = FeatureModel()
    
    var cards: Array<Card> {
        return setModel.cards
    }
    
    // MARK: - Intent(
    ///
    func choose(_ card: Card) {
        
    }
    
    /// Add 3 more cards
    func add() {
        SetGameViewModel.numberOfCards += 3
        setModel = SetGameViewModel.createSetGameModel()
    }
    
    /// Create new set game
    func newGame() {
        // FeatureModel 에 있는 features: Array<CardFeature> 을 shuffle()
        SetGameViewModel.featureModel = FeatureModel()
        
        // SetGameModel createSetGameModel 호출해서 초기화
        setModel = SetGameViewModel.createSetGameModel()
    }
}

struct Previews_SetGameViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
