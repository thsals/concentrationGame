//
//  concentration.swift
//  concentrationGame
//
//  Created by 손민 on 2021/09/26.
//

import Foundation

struct Concentration {
    var cards =  [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter {cards[$0].isFaceUp}.oneAndOnly
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//
//                    }
//                    else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue )
                
            }
        }
    }
    
    
    mutating func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                    
                }
                cards[index].isFaceUp = true
            }
            else {
                // 카드가 없거나 두장이 앞면
                
                indexOfOneAndOnlyFaceUpCard = index
                
            }
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

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
        
    }
}
