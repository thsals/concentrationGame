//
//  concentration.swift
//  concentrationGame
//
//  Created by 손민 on 2021/09/26.
//

import Foundation

class Concentration {
    var cards =  [Card]()
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
            
        }
        else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfCards: Int) {
        for _ in 1...numberOfCards {
            let card = Card()
            cards += [card,card]
//
//            cards.append(card)
//            cards.append(card)
            
        }
    }
}
