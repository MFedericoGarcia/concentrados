//
//  Card.swift
//  Concentrados
//
//  Created by Fede Garcia on 16/09/2024.
//

import Foundation

struct Card {
    
    var id: Int
    var isFaceUp = false
    var isMatched = false
    
    static var idFactory: Int = 0
    
    static func getUniqueId() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init() {
        self.id = Card.getUniqueId()
    }
}
