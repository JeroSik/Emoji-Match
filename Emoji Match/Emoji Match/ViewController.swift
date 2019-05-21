//
//  ViewController.swift
//  Emoji Match
//
//  Created by Youngsik Yoon on 5/16/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Game setup
    // Initialize controller
    private lazy var game = EmojiMatch(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    private lazy var theme = game.getRandomTheme()
    
    // Start new game on load
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }
    
    // Handle behavior for new game button
    @IBAction private func createNewGame(_ sender: UIButton) {
        startNewGame()
        sender.setTitleColor(theme.cardColor, for: UIControl.State.normal)
    }
    
    // Function to create new game and respetive instances
    private func startNewGame() {
        // Create new game instance
        game = EmojiMatch(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        
        // Change theme
        theme = game.getRandomTheme()
        emoji = [Int:String]()
        emojiChoices = theme.emojiList
        view.backgroundColor = theme.backgroundColor
        flipCountLabel.textColor = theme.cardColor
        scoreCountLabel.textColor = theme.cardColor
        
        
        // Reset cards
        for index in cardButtons.indices  {
            let button =  cardButtons[index]
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = theme.cardColor
        }
        flipCountLabel.text = "Flips: \(game.flipCount)"
        scoreCountLabel.text = "Score: \(game.score)"
    }

    // Label for flip and score count
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private weak var scoreCountLabel: UILabel!
    // Collection of all buttons (cards)
    @IBOutlet private var cardButtons: [UIButton]!
    
    // Handle behavior for pressing a button
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        
        flipCountLabel.text = "Flips: \(game.flipCount)"
        scoreCountLabel.text = "Score: \(game.score)"
    }
    
    // Communicate between model and view
    private func updateViewFromModel() {
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
    
    // MARK: Emoji handling
    // Initialize emoji choices and dictionary of emoji and cards
    private lazy var emojiChoices = theme.emojiList
    private var emoji = [Int:String]()
    
    // Handle behavior for building dictionary
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        
        return emoji[card.identifier] ?? "?"
    }
}

// MARK: Extension for int to include random number from range
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
