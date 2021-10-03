//
//  card.swift
//  concentrationGame
//
//  Created by 손민 on 2021/09/28.
//

import Foundation

struct Card: Hashable
{
    var hashValue: Int {return identifier}
    static func ==(lhs: Card,rhs: Card)-> Bool {
        return lhs.identifier == rhs.identifier
    }
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierfac = 0
    private static func getIdentifier() -> Int {
        identifierfac+=1
        return identifierfac
    }
    
    init() {
        
        self.identifier = Card.getIdentifier()
    }
}
