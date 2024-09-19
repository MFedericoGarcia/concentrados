//
//  CoNewGameButton.swift
//  Concentrados
//
//  Created by Fede Garcia on 17/09/2024.
//

import UIKit

class CoNewGameButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration = .filled()
        configuration?.title = "New Game"
        configuration?.baseBackgroundColor = .systemBlue
        configuration?.baseForegroundColor = .white
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
