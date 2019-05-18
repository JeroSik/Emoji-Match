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
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    // Initialize identifier
    static var identifierFactory = 0
    
    // MARK: Static function go assign unique identifiers
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    // MARK: Initializer for Card struct
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
