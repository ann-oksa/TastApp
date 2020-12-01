//
//  ViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 17.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    var transformation = Transformation()
    
   
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var translateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
    
        if textField.text == "" {
            translateLabel.text = "Enter the word please!"
        } else {
            self.transformation.transformTranslToLanguage(text: self.textField.text ?? "") { t in
                self.translateLabel.text = t
            }
        }
        
    }
}

