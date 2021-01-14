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
        
        game.currentIndexOfCard = 0
        game.isCardOpen = true
        game.records = shared.history.journal
        game.someCardTitle = ""
        previousButton.isHidden = true
        checkRecordsCountInHistory()
    }
    
    func checkRecordsCountInHistory(){
        if game.records.count == 0 {
            let alert = UIAlertController(title: nil, message: "You don`t have words in history", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Back to main menu", style: .default) { (al) in
                self.performSegue(withIdentifier: "unwindToMenu", sender: self)
                
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonFlip(_ sender: UIButton) {
        if  game.currentIndexOfCard < game.records.count && game.currentIndexOfCard >= 0 {
            if game.isCardOpen {
                game.isCardOpen = false
                game.someCardTitle = game.records[game.currentIndexOfCard].word2
                setButtonCardTitleAndAction()
            } else {
                game.isCardOpen = true
                game.someCardTitle = game.records[game.currentIndexOfCard].word1
                setButtonCardTitleAndAction()
            }
        } else {
            makeAlert()
        }
    }
    
    func setButtonCardTitleAndAction(){
        buttonCard.setTitle(game.someCardTitle, for: .normal)
        buttonCard.backgroundColor = .white
        UIView.transition(with: buttonCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        previousButton.isHidden = false
        game.currentIndexOfCard += 1
        chooseEnotherCard()
    }
    
    @IBAction func previousClicked(_ sender: UIButton) {
        game.currentIndexOfCard -= 1
        chooseEnotherCard()
    }
    
    func chooseEnotherCard(){
        if  game.currentIndexOfCard < game.records.count && game.currentIndexOfCard >= 0 {
            game.isCardOpen = false
            game.someCardTitle = game.records[game.currentIndexOfCard].word2
            buttonCard.setTitle(game.someCardTitle, for: .normal)
        } else {
            makeAlert()
        }
    }
    
    func makeAlert() {
        let alert = UIAlertController(title: "You learned all the words!", message: "Do you want try again?", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
            self.game.currentIndexOfCard = 0
            self.game.someCardTitle = self.game.records[self.game.currentIndexOfCard].word2
            self.buttonCard.setTitle(self.game.someCardTitle, for: .normal)
        }
        alert.addAction(cancelButton)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}
