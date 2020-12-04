//
//  ViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 17.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var transformation = Transformation()
    var targetLanguage: TargetLanguages = .empty
    var sourceLanguage: TargetLanguages = .empty
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var translateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.isHidden = true
        
    }
    
    @IBAction func segmentClicked(_ sender: UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == 0 {
            targetLanguage = .russian
            sourceLanguage = .english
        } else {
            targetLanguage = .english
            sourceLanguage = .russian
        }
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        guard let input = textField.text,
              input.isEmpty == false else {
            return
        }
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        self.transformation.transformTranslToLanguage(text: input , targetLang: targetLanguage, sourceLang: sourceLanguage) { t in
            
            self.translateLabel.text = t
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
    @IBAction func historyClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toHistoryVC", sender: nil)
    }
}

