//
//  card.swift
//  concentrationGame
//
//  Created by 손민 on 2021/09/28.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierfac = 0
    static func getIdentifier() -> Int {
        identifierfac+=1
        return identifierfac
    }
    
    init() {
        
        self.identifier = Card.getIdentifier()
    }
}
