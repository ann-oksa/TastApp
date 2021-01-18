//
//  GameViewModel.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 18.01.2021.
//

import Foundation

protocol GameDelegate: class {
    
    func setButtonCardTitleAndAction()
    func makeAlert()
    func setTitleForButtonCard(with title: String)
}

class GameViewModel {
    
    var game = Game()
    let shared = AppState.shared
    let constants = IdentifiersForSegue()
    
    weak var delegate: GameDelegate?
    
    func setValueForNewGame() {
        game.currentIndexOfCard = 0
        game.isCardOpen = true
        game.records = shared.history.journal
        game.someCardTitle = ""
        
    }
    
    func buttonFlip() {
        if  game.currentIndexOfCard < game.records.count && game.currentIndexOfCard >= 0 {
            if game.isCardOpen {
                game.isCardOpen = false
                game.someCardTitle = game.records[game.currentIndexOfCard].word2
                delegate?.setButtonCardTitleAndAction()
            } else {
                game.isCardOpen = true
                game.someCardTitle = game.records[game.currentIndexOfCard].word1
                delegate?.setButtonCardTitleAndAction()
            }
        } else {
            delegate?.makeAlert()
        }
    }
    
    func nextClicked() {
        game.currentIndexOfCard += 1
    }
    
    func previousClicked() {
        game.currentIndexOfCard -= 1
    }
    
    
    func chooseEnotherCard(){
        if  game.currentIndexOfCard < game.records.count && game.currentIndexOfCard >= 0 {
            game.isCardOpen = false
            game.someCardTitle = game.records[game.currentIndexOfCard].word2
            delegate?.setTitleForButtonCard(with: self.game.someCardTitle)
            
        } else {
            delegate?.makeAlert()
        }
    }
    
    
}
