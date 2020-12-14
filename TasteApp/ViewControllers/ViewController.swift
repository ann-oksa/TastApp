//
//  ViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 17.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var transformation = TranslationService()
    
    var appState = AppState.shared
    
    @IBOutlet weak var changingLanguageController: UISegmentedControl!
    @IBOutlet weak var indicatorOfDownloading: UIActivityIndicatorView!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var wordInputTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicatorOfDownloading.isHidden = true
        changingLanguageController.selectedSegmentIndex = 0
        appState.changeLanguageDependingOnTheIndex(index: changingLanguageController.selectedSegmentIndex)
        
        
    }
    
    @IBAction func changeLanguage(_ sender: UISegmentedControl) {
        appState.changeLanguageDependingOnTheIndex(index: changingLanguageController.selectedSegmentIndex)

    }
    
    @IBAction func getTranslate(_ sender: UIButton) {
        guard let input = wordInputTextField.text,
              input.isEmpty == false else {
            return
        }
        indicatorOfDownloading.isHidden = false
        indicatorOfDownloading.startAnimating()
        
        self.transformation.transformTranslToLanguage(text: input , targetLang: appState.targetLanguage, sourceLang: appState.sourceLanguage) { t in
            
            self.translationLabel.text = t
            self.indicatorOfDownloading.stopAnimating()
            self.indicatorOfDownloading.isHidden = true
            self.appState.createRecord(word1: self.wordInputTextField.text!, word2: self.translationLabel.text!)
           
            
        }
        
    }
    
    @IBAction func historyClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toHistoryVC", sender: nil)
        
    }
    
    
    
}

