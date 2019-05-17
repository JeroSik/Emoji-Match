//
//  ViewController.swift
//  Emoji Match
//
//  Created by Youngsik Yoon on 5/16/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func touchSmileCard(_ sender: UIButton) {
        flipCard(withEmoji: "😀", on: sender)
    }
    
    @IBAction func touchGhostCard(_ sender: UIButton) {
        flipCard(withEmoji: "👻", on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard withEmoji \(emoji)")
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.6392156863, green: 0.6666666667, blue: 0.6823529412, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

