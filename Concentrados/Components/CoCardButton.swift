//
//  CoCardButton.swift
//  Concentrados
//
//  Created by Fede Garcia on 16/09/2024.
//

import UIKit

class CoCardButton: UIButton {

    init(withTitle title: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        configuration = .tinted()
        configuration?.baseForegroundColor = .white
        configuration?.baseBackgroundColor = .purple
        configuration?.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addTitle(title: String, color: UIColor) {
        configuration?.title = title
        configuration?.baseBackgroundColor = color
    }
    
}

