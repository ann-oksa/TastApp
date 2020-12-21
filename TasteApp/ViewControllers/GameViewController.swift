//
//  GameViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 14.12.2020.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var buttonCard: UIButton!
    
    var isOpen = false
    let shared = AppState.shared
    var index = 0
    var cardTitle: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func buttonFlip(_ sender: UIButton) {
        
        if isOpen {
            isOpen = false
         
//            let title = "Summer"
             cardTitle = shared.history.journal[index].word1
            buttonCard.setTitle(cardTitle, for: .normal)
            buttonCard.backgroundColor  = .lightGray
            
            UIView.transition(with: buttonCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            //   let image = UIImage(named: "summer")
//            buttonCard.setImage(image, for: .normal)
//            UIView.transition(with: buttonCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        } else {
            isOpen = true
//            let image = UIImage(named: "winter")
//            buttonCard.setImage(image, for: .normal)
//            UIView.transition(with: buttonCard, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
//            let title = "Winter"
             cardTitle = shared.history.journal[index].word2

            buttonCard.setTitle(cardTitle, for: .normal)
            buttonCard.backgroundColor = .white
            UIView.transition(with: buttonCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        index += 1
        
    }
    
    @IBAction func previousClicked(_ sender: UIButton) {
    }
    
}
