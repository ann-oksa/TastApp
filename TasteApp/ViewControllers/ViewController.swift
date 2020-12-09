//
//  ViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 17.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var transformation = TranslationService()
    var targetLanguage: Language = .russian
    var sourceLanguage: Language = .english
    var info = Information.shared
    
    @IBOutlet weak var changingLanguageController: UISegmentedControl!
    @IBOutlet weak var indicatorOfDownloading: UIActivityIndicatorView!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var wordInputTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorOfDownloading.isHidden = true
        changingLanguageController.selectedSegmentIndex = 0
        changeLanguageDependingOnTheIndex()
    }
    
    func changeLanguageDependingOnTheIndex() {
       
        if changingLanguageController.selectedSegmentIndex == 0 {
            targetLanguage = .russian
            sourceLanguage = .english
        } else {
            targetLanguage = .english
            sourceLanguage = .russian
        }
    }

    
    @IBAction func changeLanguage(_ sender: UISegmentedControl) {
        changeLanguageDependingOnTheIndex()
    }
    
    @IBAction func getTranslate(_ sender: UIButton) {
        guard let input = wordInputTextField.text,
              input.isEmpty == false else {
            return
        }
        indicatorOfDownloading.isHidden = false
        indicatorOfDownloading.startAnimating()
        
        self.transformation.transformTranslToLanguage(text: input , targetLang: targetLanguage, sourceLang: sourceLanguage) { t in
            
            self.translationLabel.text = t
            self.indicatorOfDownloading.stopAnimating()
            self.indicatorOfDownloading.isHidden = true
            self.addDataToHistory()
        }
        
    }
    
    @IBAction func historyClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toHistoryVC", sender: nil)
    }
    
    func addDataToHistory(){
        self.info.word  = self.wordInputTextField.text ?? "word"
        self.info.translation = self.translationLabel.text ?? "trans"
    }
    
}

