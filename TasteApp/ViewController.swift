//
//  ViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 17.11.2020.
//

import UIKit

//я достаю с джейсона дату
//я сохраняю ее себе в модель
//я определяю язык, на котором написали
//я перевожу на второй язык
//

class ViewController: UIViewController {

    var networkManager = NetworkManager()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var translateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    
    @IBAction func buttonClicked(_ sender: UIButton) {
        print("button clicked")
        networkManager.onCompletion = { translate in
            print("translate.russian in vc \(translate.russian)")
            DispatchQueue.main.async {
                self.translateLabel.text = translate.russian
            }
            
        }
         self.networkManager.translate(text: self.textField.text!)

        
        
       
    }
    
}

