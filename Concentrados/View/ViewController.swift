//
//  ViewController.swift
//  Concentrados
//
//  Created by Fede Garcia on 16/09/2024.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: 2)
    
    var cardButton = CoCardButton(withTitle: "")
    var cardButton2 = CoCardButton(withTitle: "")
    var cardButton3 = CoCardButton(withTitle: "")
    var cardButton4 = CoCardButton(withTitle: "")
    var flipCountLabel = CoFlipCountLabel(withText: "Flip: 0")
    var flipCount = 0 { didSet { flipCountLabel.flipSum(newValue: "Flip: \(flipCount)")}}
    
    lazy var cardButtons = [ cardButton, cardButton2, cardButton3, cardButton4 ]


    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubviews(cardButton, cardButton2, cardButton3, cardButton4, flipCountLabel)
        cardButton.addTarget(self, action: #selector(cardButtonAction), for: .touchUpInside)
        cardButton2.addTarget(self, action: #selector(cardButtonAction), for: .touchUpInside)
        cardButton3.addTarget(self, action: #selector(cardButtonAction), for: .touchUpInside)
        cardButton4.addTarget(self, action: #selector(cardButtonAction), for: .touchUpInside)

        NSLayoutConstraint.activate([
            cardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            cardButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardButton.heightAnchor.constraint(equalToConstant: 100),
            cardButton.widthAnchor.constraint(equalToConstant: 50),
            
            cardButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            cardButton2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardButton2.heightAnchor.constraint(equalToConstant: 100),
            cardButton2.widthAnchor.constraint(equalToConstant: 50),
            
            cardButton3.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            cardButton3.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            cardButton3.heightAnchor.constraint(equalToConstant: 100),
            cardButton3.widthAnchor.constraint(equalToConstant: 50),
            
            cardButton4.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            cardButton4.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            cardButton4.heightAnchor.constraint(equalToConstant: 100),
            cardButton4.widthAnchor.constraint(equalToConstant: 50),
            
            flipCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flipCountLabel.topAnchor.constraint(equalTo: cardButton.bottomAnchor, constant: 100),
            flipCountLabel.heightAnchor.constraint(equalToConstant: 55)
        
        ])
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isMatched {
                button.addTitle(title: "", color: .clear)
            } else {
                if card.isFaceUp {
                    button.addTitle(title: emoji(for: card), color: .secondaryLabel)
                } else {
                    button.addTitle(title: "", color: .purple)
                }
            }
        }
    }
    
    
    var emojiChoices = ["🐶", "🐵", "🐦‍⬛", "🐺"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.id] == nil, emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.id] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.id] ?? "?"
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

