//
//  Emoji Match.swift
//  Emoji Match
//
//  Created by Youngsik Yoon on 5/17/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation

class EmojiMatch {
    var cards = [Card] ()
    
    func chooseCard(at Index: Int) {
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
}
