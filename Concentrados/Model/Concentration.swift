//
//  Concentration.swift
//  Concentrados
//
//  Created by Fede Garcia on 16/09/2024.
//

import Foundation


struct Concentration {
    
    private(set) var cards = [Card]()
        
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCards =  cards.indices.filter { cards[$0].isFaceUp }
            return faceUpCards.count == 1 ? faceUpCards.first : nil
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating public func newGame(numberOfPairsOfCards: Int) {

    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): \(index) is not a valid index for the cards array.")
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards >= 2, "Concentration.init(\(numberOfPairsOfCards)): numberOfPairsOfCards must be at least 2.")
        
        var shuffledCards = [Card]()
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            shuffledCards.append(card)
            shuffledCards.append(card)
        }
        
        // SHUFFLE HOMEWORK
        
        cards = shuffledCards.shuffled()
        
        
    }
    
}
