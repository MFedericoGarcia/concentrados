//
//  Int+Ext.swift
//  Concentrados
//
//  Created by Fede Garcia on 17/09/2024.
//
import Foundation

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
