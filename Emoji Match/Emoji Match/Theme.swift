//
//  Theme.swift
//  Emoji Match
//
//  Created by Youngsik Yoon on 5/20/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    // Initialize theme property variables
    var emojiChoices: [String] = []
    var backgroundColor: UIColor?
    var cardColor: UIColor?
    
    // MARK: Initializer for Theme struct
    init(emojiList: [String], backgroundColor: UIColor?, cardColor: UIColor?) {
        self.emojiChoices = emojiList
        self.backgroundColor = backgroundColor
        self.cardColor = cardColor
    }
}
