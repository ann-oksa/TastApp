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
        checkRecordsCountInHistory()
        
    }
    
    @IBAction func buttonFlip(_ sender: UIButton) {
        gameViewModel.buttonFlip()
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        gameViewModel.nextClicked()
        gameViewModel.chooseEnotherCard()
    }
    
    @IBAction func previousClicked(_ sender: UIButton) {
        gameViewModel.previousClicked()
        gameViewModel.chooseEnotherCard()
        
    }
    
    func setButtonCardTitleAndAction() {
        setTitleForButtonCard(with: gameViewModel.game.someCardTitle)
        buttonCard.backgroundColor = .white
        UIView.transition(with: buttonCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    func makeAlert() {
        let alert = UIAlertController(title: gameViewModel.learnAllWords, message: gameViewModel.doYouWantToPlayAgain, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: gameViewModel.cancel, style: .cancel, handler: nil)
        let okButton = UIAlertAction(title: gameViewModel.ok, style: .default) { (action) in
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
            let alert = UIAlertController(title: nil, message: gameViewModel.dontHaveWords, preferredStyle: .alert)
            let okButton = UIAlertAction(title: gameViewModel.backToMainMenu, style: .default) { (al) in
                self.performSegue(withIdentifier: self.gameViewModel.constants.unwindSegueFromGameToTranslation, sender: self)
                
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func setTitleForButtonCard(with title: String) {
        buttonCard.setTitle(title, for: .normal)
    }
    
    func visibilityOfPreviousButton(is: Bool) {
        previousButton.isHidden = gameViewModel.isPreviousButtonHidden
    }
    
}
