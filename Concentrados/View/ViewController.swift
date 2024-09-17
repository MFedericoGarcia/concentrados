//
//  ViewController.swift
//  Concentrados
//
//  Created by Fede Garcia on 16/09/2024.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairsOfCards: 12)
 
    private var flipCountLabel = CoFlipCountLabel(withText: "Flip: 0")
    private(set) var flipCount = 0 { didSet { flipCountLabel.flipSum(newValue: "Flip: \(flipCount)")}}
    
    private var newGameButton = CoNewGameButton()
    
    private var container = CoFinalStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .systemBackground
        view.addSubviews(flipCountLabel, container, newGameButton)
        
        for cardButton in container.cardButtons {
            cardButton.addTarget(self, action: #selector(cardButtonAction), for: .touchUpInside)
        }
        
        newGameButton.addTarget(self, action: #selector(newButtonAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            container.bottomAnchor.constraint(equalTo: flipCountLabel.topAnchor, constant: -80),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            flipCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            flipCountLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            flipCountLabel.heightAnchor.constraint(equalToConstant: 55),
            
            newGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            newGameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            newGameButton.heightAnchor.constraint(equalToConstant: 55),
            newGameButton.widthAnchor.constraint(equalToConstant: 120)
        
        ])
    }
    
    @objc func cardButtonAction() {
        flipCount += 1
    }
    
    @objc func newButtonAction() {
        flipCount = 0
        game.newGame(numberOfPairsOfCards: 12)
    }

}


struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}

struct ViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
