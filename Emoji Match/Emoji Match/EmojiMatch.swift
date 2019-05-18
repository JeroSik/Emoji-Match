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
    
    // MARK: Handle behvaior for choosen cards
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
