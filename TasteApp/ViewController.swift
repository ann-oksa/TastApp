//
//  ViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 17.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    var transformation = Transformation()
    
    var newTM = NewTranslateManager()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var translateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newTM.createURLComponents(text: "hello", targetLang: .english, sourseLang: .russian)
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        guard let input = textField.text,
              input.isEmpty == false else {
            return
        }
        activityIndicator.isHidden = false
        activityIndicator.stopAnimating()
        self.transformation.transformTranslToLanguage(text: self.textField.text ?? "") { t in
            self.translateLabel.text = t
            
        }
        
    }
}

