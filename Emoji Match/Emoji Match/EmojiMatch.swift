//
//  Emoji Match.swift
//  Emoji Match
//
//  Created by Youngsik Yoon on 5/17/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation

class EmojiMatch {
    // Initialize array of cards
    var cards = [Card] ()
    // Initialize optional of whether or not a card is facing up and return index
    var indexOfOneAndOnlyFaceUpCard: Int?
    // Initialize score and flip counter
    var score = 0, flipCount = 0
    
    // Initialize array of themes
    var themes: [String: Theme] = [
        "Smileys": Theme(emojiList: ["😃", "😍", "😈", "😷", "🥶", "😡", "😨", "🤢", "😎", "😞"], backgroundColor: #colorLiteral(red: 1, green: 0.8813909292, blue: 0.1847001314, alpha: 1), cardColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
        "People": Theme(emojiList: ["👶", "💂‍♀️", "👩‍🚀", "👩‍✈️", "🧙‍♂️", "💃", "🧖‍♀️", "🎅", "👨‍🏫", "👩‍🍳"], backgroundColor: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), cardColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),
        "Animals": Theme(emojiList: ["🐶", "🐹", "🦊", "🐼", "🐨", "🐸", "🙉", "🐔", "🐧", "🐬"], backgroundColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), cardColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)),
        "Weather": Theme(emojiList: ["☀️", "🌤", "⛅️", "🌥", "☁️", "🌦", "🌧", "⛈", "🌩", "🌨"], backgroundColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), cardColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),
        "Food": Theme(emojiList: ["🍎", "🍑", "🍍", "🥝", "🍣", "🍙", "🍰", "🍭", "🍿", "🥜"], backgroundColor: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), cardColor: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))
    ]
    
    // MARK: Handle behavior for choosen cards
    func chooseCard(at index: Int) {
        //  Check to make sure card isn't already matched
        if !cards[index].isMatched {
            // Case for when one card is face up
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Case if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            // Case when either no cards or 2 cards are face up
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    // MARK: Handle behavior for choosing a random theme
    func getRandomTheme() -> Theme {
        return themes.randomElement()!.value
    }
    
    // MARK: Initializer for Control
    init(numberOfPairsOfCards: Int) {
        // Iterate through each card and assign a pair
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // Shuffle cards
        cards.shuffle()
    }
}
