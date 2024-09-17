//
//  Card.swift
//  Concentrados
//
//  Created by Fede Garcia on 16/09/2024.
//

import Foundation

struct Card: Hashable {
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.id == rhs.id
    }
    
    private var id: Int
    var isFaceUp = false
    var isMatched = false
    
    private static var idFactory: Int = 0
    
    private static func getUniqueId() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init() {
        self.id = Card.getUniqueId()
    }
}
