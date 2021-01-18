//
//  GameViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 14.12.2020.
//

import UIKit

class GameViewController: UIViewController, GameDelegate {
   
    @IBOutlet weak var buttonCard: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let gameViewModel = GameViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameViewModel.delegate =  self
        gameViewModel.setValueForNewGame()
        previousButton.isHidden = gameViewModel.thePreviousButtonIsHidden
        checkRecordsCountInHistory()
        
    }
    
    @IBAction func buttonFlip(_ sender: UIButton) {
        gameViewModel.buttonFlip()
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        previousButton.isHidden = gameViewModel.thePreviousButtonIsNotHidden
        gameViewModel.nextClicked()
        gameViewModel.chooseEnotherCard()
    }
    
    @IBAction func previousClicked(_ sender: UIButton) {
        gameViewModel.previousClicked()
        gameViewModel.chooseEnotherCard()
        
    }
    
    //tnterred parametrs
    func setButtonCardTitleAndAction() {
        setTitleForButtonCard(with: gameViewModel.game.someCardTitle)
        buttonCard.backgroundColor = .white
        UIView.transition(with: buttonCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    func makeAlert() {
        let alert = UIAlertController(title: MessageInAlert.learnAllWords.rawValue, message: MessageInAlert.doYouWantToPlayAgain.rawValue, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: MessageInAlert.cancel.rawValue, style: .cancel, handler: nil)
        let okButton = UIAlertAction(title: MessageInAlert.ok.rawValue, style: .default) { (action) in
            
            //refactoring???
            self.gameViewModel.game.currentIndexOfCard = 0
            self.gameViewModel.game.someCardTitle = self.gameViewModel.game.records[self.gameViewModel.game.currentIndexOfCard].word2
            //
            self.setTitleForButtonCard(with: self.gameViewModel.game.someCardTitle)
        }
        alert.addAction(cancelButton)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkRecordsCountInHistory(){
        if gameViewModel.game.records.count == 0 {
            let alert = UIAlertController(title: nil, message: "You don`t have words in history", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Back to main menu", style: .default) { (al) in
                self.performSegue(withIdentifier: self.gameViewModel.constants.unwindSegueFromGameToTranslation, sender: self)
                
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func setTitleForButtonCard(with title: String) {
        buttonCard.setTitle(title, for: .normal)
    }
    
}
