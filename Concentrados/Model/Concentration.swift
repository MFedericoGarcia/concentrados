//
//  Concentration.swift
//  Concentrados
//
//  Created by Fede Garcia on 16/09/2024.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        cards[index].isFaceUp.toggle()
        
        
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        
        // SHUFFLE HOMEWORK
    }
    
}
