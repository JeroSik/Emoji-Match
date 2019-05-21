//
//  Card.swift
//  Emoji Match
//
//  Created by Youngsik Yoon on 5/17/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation

struct Card {
    // Initialize card property variables
    var isFaceUp = false {
        didSet {
            if isFaceUp {
                hasBeenViewed = true
            }
        }
    }
    var isMatched = false
    var identifier: Int
    var hasBeenViewed = false
    
    // Initialize identifier
    private static var identifierFactory = 0
    
    // MARK: Static function go assign unique identifiers
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    // MARK: Initializer for Card struct
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
