//
//  ViewController.swift
//  Emoji Match
//
//  Created by Youngsik Yoon on 5/16/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = EmojiMatch(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    lazy var theme = game.getRandomTheme()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }

    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    @IBAction func createNewGame(_ sender: UIButton) {
        startNewGame()
    }
    
    func startNewGame() {
        // Create new game instance
        game = EmojiMatch(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        
        // Change theme
        theme = game.getRandomTheme()
        emoji = [Int:String]()
        emojiChoices = theme.emojiList
        view.backgroundColor = theme.backgroundColor
        
        // Reset cards
        for index in cardButtons.indices  {
            let button =  cardButtons[index]
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = theme.cardColor
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices  {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = theme.cardColor
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.6392156863, green: 0.6666666667, blue: 0.6823529412, alpha: 0) : theme.cardColor
            }
        }
    }
    
    lazy var emojiChoices = theme.emojiList
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
}
