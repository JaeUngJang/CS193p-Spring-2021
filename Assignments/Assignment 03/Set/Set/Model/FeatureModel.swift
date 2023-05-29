//
//  FeatureModel.swift
//  Set
//
//  Created by JaeUngJang on 2023/05/29.
//

import Foundation

struct FeatureModel: Equatable {
    
    static func == (lhs: FeatureModel, rhs: FeatureModel) -> Bool {
        return lhs.features == rhs.features
    }
    private static let numbersOfShapes = [1, 2, 3]
    private static let shapes = ["suit.diamond", "rectangle", "capsule"]
    private static let shades = ["solid", "vague", "open"]
    private static let colors = ["red", "green", "purple"]

    private(set) var features: Array<CardFeature>
    
    init() {
        features = []
        
        for number in FeatureModel.numbersOfShapes {
            for shape in FeatureModel.shapes {
                for shade in FeatureModel.shades {
                    for color in FeatureModel.colors {
                        features.append(CardFeature(
                            numberOfShapes: number,
                            shape: shape,
                            shade: shade,
                            color: color,
                            id: UUID.init())
                        )
                    }
                }
            }
        }
        features.shuffle()
    }
    
    struct CardFeature: Identifiable, Equatable {
        let numberOfShapes: Int
        let shape: String
        let shade: String
        let color: String
        let id: UUID
    }
}
