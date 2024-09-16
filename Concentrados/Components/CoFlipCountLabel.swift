//
//  CoFlipCountLabel.swift
//  Concentrados
//
//  Created by Fede Garcia on 16/09/2024.
//

import UIKit

class CoFlipCountLabel: UILabel {
        
    init(withText text: String) {
        super.init(frame: .zero)
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 30, weight: .bold)
        textColor = .systemOrange
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func flipSum(newValue: String) {
        self.text = newValue
    }
}
