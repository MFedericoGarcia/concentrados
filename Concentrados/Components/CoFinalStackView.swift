//
//  CoFinalStackView.swift
//  Concentrados
//
//  Created by Fede Garcia on 17/09/2024.
//

import UIKit

class CoFinalStackView: UIStackView {
    
    var cardButton = CoCardButton(withTitle: "")
    var cardButton2 = CoCardButton(withTitle: "")
    var cardButton3 = CoCardButton(withTitle: "")
    var cardButton4 = CoCardButton(withTitle: "")
    
    var cardButton5 = CoCardButton(withTitle: "")
    var cardButton6 = CoCardButton(withTitle: "")
    var cardButton7 = CoCardButton(withTitle: "")
    var cardButton8 = CoCardButton(withTitle: "")
    
    var cardButton9 = CoCardButton(withTitle: "")
    var cardButton10 = CoCardButton(withTitle: "")
    var cardButton11 = CoCardButton(withTitle: "")
    var cardButton12 = CoCardButton(withTitle: "")
    
    lazy var Rows = [[cardButton, cardButton2, cardButton3, cardButton4] , [cardButton5, cardButton6, cardButton7, cardButton8], [cardButton9, cardButton10, cardButton11, cardButton12]]
    lazy var cardButtons = [ cardButton, cardButton2, cardButton3, cardButton4, cardButton5, cardButton6, cardButton7, cardButton8, cardButton9, cardButton10, cardButton11, cardButton12 ]
    lazy var game = Concentration(numberOfPairsOfCards: 12)
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var stacksFilled: [UIStackView] = []
        
        for row in Rows {
            stacksFilled.append(CoStackView(array: row))
        }
        
        stacksFilled.forEach { addArrangedSubview($0) }

        axis = .vertical
        distribution = .fillEqually
        alignment = .fill
        spacing = 30
        self.frame.size.height = 100
        
        for cardButton in cardButtons {
            cardButton.addTarget(self, action: #selector(cardButtonAction), for: .touchUpInside)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            
            let button = cardButtons[index]
            let card = game.cards[index]
            
            
            if card.isMatched {
                let animator = UIViewPropertyAnimator(duration: 1, curve: .linear) {
                    button.addTitle(title: "", color: .clear)
                }
                animator.startAnimation(afterDelay: 1)
            } else {
                if card.isFaceUp {
                    button.addTitle(title: emoji(for: card), color: .secondaryLabel)
                } else {
                    button.addTitle(title: "", color: .purple)
                }
            }
        }
    }
    
    
//    var emojiChoices = ["🐶", "🐵", "🐦‍⬛", "🐺", "🦆", "🦅", "🐥", "🐸", "🐯", "🐹", "🪿", "🐴"]
    
    var emojiChoices = "🐶🐵🐦‍⬛🐺🦆🦅🐥🐸"
    
    var emoji = [Card:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at:randomStringIndex ))
        }
        return emoji[card] ?? "?"
    }
    
    
    @objc func cardButtonAction(_ sender: CoCardButton) {
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("oasdajsdiuasdj")
        }
    }

    
    
}
