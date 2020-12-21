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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonFlip(_ sender: UIButton) {
        
        if isOpen {
            isOpen = false
         
            let title = "Summer"
            buttonCard.setTitle(title, for: .normal)
            UIView.transition(with: buttonCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            //   let image = UIImage(named: "summer")
//            buttonCard.setImage(image, for: .normal)
//            UIView.transition(with: buttonCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        } else {
            isOpen = true
//            let image = UIImage(named: "winter")
//            buttonCard.setImage(image, for: .normal)
//            UIView.transition(with: buttonCard, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
            let title = "Winter"
            buttonCard.setTitle(title, for: .normal)
            UIView.transition(with: buttonCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }
    
    

}
