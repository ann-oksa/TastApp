//
//  ViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 17.11.2020.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
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
        self.wordInputTextField.delegate = self
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardWithTappingOnScreen))
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func hideKeyboardWithTappingOnScreen() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func changeLanguage(_ sender: UISegmentedControl) {
        appState.changeLanguageDependingOnTheIndex(index: changingLanguageController.selectedSegmentIndex)
    }
    
    @IBAction func getTranslate(_ sender: UIButton) {
        guard let inputText = wordInputTextField.text,
              inputText.isEmpty == false else {
            return
        }
        indicatorOfDownloading.isHidden = false
        indicatorOfDownloading.startAnimating()
        
        self.transformation.transformTranslationToLanguage(text: inputText , targetLanguage: appState.targetLanguage, sourceLanguage: appState.sourceLanguage) { translatedText in
            
            self.translationLabel.text = translatedText
            self.indicatorOfDownloading.stopAnimating()
            self.indicatorOfDownloading.isHidden = true
            // Assignment for this variable made for right saving words (english words in one group, russian words in enother group)
            var word1 = String()
            var word2 = String()
            if self.appState.targetLanguage == .russian {
                word1 = self.wordInputTextField.text ?? ""
                word2  = self.translationLabel.text ?? ""
            } else {
                word1 = self.translationLabel.text ?? ""
                word2 = self.wordInputTextField.text ?? ""
            }
            self.appState.createRecord(word1: word1, word2: word2)
        }
    }
    
    @IBAction func historyClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toHistoryVC", sender: nil)
    }
    
    @IBAction func gameClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toGameVC", sender: nil)
        
        
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
        
    }
    
    
}

