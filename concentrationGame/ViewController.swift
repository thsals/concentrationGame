//
//  ViewController.swift
//  concentrationGame
//
//  Created by 손민 on 2021/09/23.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = Concentration(numberOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count+1)/2
    }
    
    private(set) var flipCount: Int = 0 {
        didSet{
            let attributes: [NSAttributedString.Key: Any] = [
                .strokeWidth : 5.0,
                .strokeColor : UIColor.orange
            ]
            let attributeString = NSAttributedString(string: "Flips : \(flipCount)", attributes: attributes)
            flipCountLable.attributedText = attributeString
        }
    }
    

    @IBOutlet private var flipCountLable: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNum = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNum)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor(white: 0, alpha: 100) : UIColor.orange
            }
        }
    }
    
    private var emojichoices = ["🎃","👻","🐈","🐇","🐵","🐯","🦁","🐷","🦊"]
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        }
//        else {
//            return "?"
//        }
        if emoji[card] == nil {
            if emojichoices.count>0 {
                
                emoji[card] = emojichoices.remove(at: emojichoices.count.arc4random)
            }
            
        }
        return emoji[card ] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        }
        else {
            return 0
        }
    }
}

