//
//  CoStackView.swift
//  Concentrados
//
//  Created by Fede Garcia on 17/09/2024.
//

import UIKit
import SwiftUI

class CoStackView: UIStackView {

    init(array: [CoCardButton]) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        array.forEach { addArrangedSubview($0) }
        
        axis = .horizontal
        distribution = .fillEqually
        alignment = .fill
        spacing = 10
        self.frame.size.height = 50
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}


