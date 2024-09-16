//
//  ViewController.swift
//  Concentrados
//
//  Created by Fede Garcia on 16/09/2024.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: 4)
    
    var cardButton2 = CoCardButton(withTitle: "")
    var cardButton = CoCardButton(withTitle: "")
    lazy var cardButtons = [ cardButton, cardButton2 ]
    var flipCountLabel = CoFlipCountLabel(withText: "Flip: 0")
    var flipCount = 0 { didSet { flipCountLabel.flipSum(newValue: "Flip: \(flipCount)")}}
    var emojiChoices = ["🐶", "🐵", "🐦‍⬛", "🐺"]

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubviews(cardButton, cardButton2, flipCountLabel)
        cardButton.addTarget(self, action: #selector(cardButtonAction), for: .touchUpInside)
        cardButton2.addTarget(self, action: #selector(cardButtonAction), for: .touchUpInside)

        NSLayoutConstraint.activate([
            cardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            cardButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardButton.heightAnchor.constraint(equalToConstant: 100),
            cardButton.widthAnchor.constraint(equalToConstant: 50),
            
            cardButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            cardButton2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardButton2.heightAnchor.constraint(equalToConstant: 100),
            cardButton2.widthAnchor.constraint(equalToConstant: 50),
            
            flipCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flipCountLabel.topAnchor.constraint(equalTo: cardButton.bottomAnchor, constant: 100),
            flipCountLabel.heightAnchor.constraint(equalToConstant: 55)
        
        ])
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.addTitle(title: emoji(for: card), color: .secondaryLabel)
            } else {
                button.addTitle(title: "", color: .purple)
            }
        }
    }
    
//    func flipCard(withEmoji emoji: String, on button: CoCardButton) {
//        if !flipCard {
//            button.addTitle(title: emoji, color: .secondaryLabel)
//        } else {
//            button.addTitle(title: "", color: .purple)
//        }
//    }
    
    func emoji(for card: Card) -> String {
        return "?"
    }
    
    
    @objc func cardButtonAction(_ sender: CoCardButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("oasdajsdiuasdj")
        }
    }


}

