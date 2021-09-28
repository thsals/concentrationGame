//
//  ViewController.swift
//  concentrationGame
//
//  Created by 손민 on 2021/09/23.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfCards: (cardButtons.count+1)/2)
    var flipCount: Int = 0 {
        didSet{
            flipCountLable.text = "Flips : \(flipCount)"
        }
    }
    

    @IBOutlet var flipCountLable: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojis: Array<String> = ["👻","🎃","👻","🎃"]
    
    
    @IBAction func touchCard(_ sender: UIButton) {
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
                button.backgroundColor = card.isMatched ? UIColor(white: 1, alpha: 100) : UIColor.orange
            }
        }
    }
    
    var emojichoices = ["🎃","👻","🐈","🐇","🐵","🐯","🦁","🐷","🦊"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        }
//        else {
//            return "?"
//        }
        if emoji[card.identifier] == nil {
            if emojichoices.count>0 {
                let ramdomIndex = Int(arc4random_uniform(UInt32(emojichoices.count)))
                emoji[card.identifier] = emojichoices.remove(at: ramdomIndex)
            }
            
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

