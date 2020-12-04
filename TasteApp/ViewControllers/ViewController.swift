//
//  ViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 17.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    var transformation = Transformation()
    
    var newTM = CreatingURLManager()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var translateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //  activityIndicator.isHidden = true

    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        guard let input = textField.text,
              input.isEmpty == false else {
            return
        }
      //  activityIndicator.isHidden = false
        activityIndicator.startAnimating()
       
        self.transformation.transformTranslToLanguage(text: input ?? "") { t in
            self.translateLabel.text = t
            
        }

          // activityIndicator.stopAnimating()
      //  activityIndicator.isHidden = true
    }
    
    @IBAction func historyClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toHistoryVC", sender: nil)
    }
    
}

