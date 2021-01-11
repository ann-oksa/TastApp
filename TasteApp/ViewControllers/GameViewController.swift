//
//  GameViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 14.12.2020.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var buttonCard: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var game = Game()
    let shared = AppState.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game.currentIndex = 0
        game.isOpen = true
        game.records = shared.history.journal
        game.someCardTitle = ""
        previousButton.isHidden = true
        
    }
    
    @IBAction func buttonFlip(_ sender: UIButton) {
        
        if  game.currentIndex < game.records.count && game.currentIndex >= 0 {
            if game.isOpen {
                game.isOpen = false
                game.someCardTitle = game.records[game.currentIndex].word2
                buttonCard.setTitle(game.someCardTitle, for: .normal)
                buttonCard.backgroundColor = .white
                UIView.transition(with: buttonCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            } else {
                game.isOpen = true
                game.someCardTitle = game.records[game.currentIndex].word1
                buttonCard.setTitle(game.someCardTitle, for: .normal)
                buttonCard.backgroundColor = .white
                UIView.transition(with: buttonCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }
        } else {
            makeAlert()
        }
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        previousButton.isHidden = false
        game.currentIndex += 1
        if  game.currentIndex < game.records.count && game.currentIndex >= 0 {
            game.isOpen = false
            game.someCardTitle = game.records[game.currentIndex].word2
            buttonCard.setTitle(game.someCardTitle, for: .normal)
        } else {
            makeAlert()
        }
    }
    
    @IBAction func previousClicked(_ sender: UIButton) {
        game.currentIndex -= 1
        if  game.currentIndex < game.records.count && game.currentIndex >= 0 {
            game.isOpen = false
            game.someCardTitle = game.records[game.currentIndex].word2
            buttonCard.setTitle(game.someCardTitle, for: .normal)
        } else {
            makeAlert()
        }
    }
    
    
    func makeAlert() {
        let alert = UIAlertController(title: "You learned all the words!", message: "Do you want try again?", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
            self.game.currentIndex = 0
            self.game.someCardTitle = self.game.records[self.game.currentIndex].word2
            self.buttonCard.setTitle(self.game.someCardTitle, for: .normal)
        }
        alert.addAction(cancelButton)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}
