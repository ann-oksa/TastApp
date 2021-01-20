//
//  ViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 17.11.2020.
//

import UIKit

class TranslationViewController: UIViewController, UITextFieldDelegate, TranslationDelegate {
    
    let translationViewModel = TranslationViewModel()
    
    @IBOutlet weak var changingLanguageController: UISegmentedControl!
    @IBOutlet weak var indicatorOfDownloading: UIActivityIndicatorView!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var wordInputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        translationViewModel.delegate = self
        self.wordInputTextField.delegate = self
        changingLanguageController.selectedSegmentIndex = 0
        translationViewModel.changeLanguageDependingOnTheIndex(index: changingLanguageController.selectedSegmentIndex)
        
        isLoadingInProgress(loading: translationViewModel.isIndicatorOfDownloadingHidden)
        
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
        translationViewModel.changeLanguageDependingOnTheIndex(index: changingLanguageController.selectedSegmentIndex)
    }
    
    @IBAction func getTranslate(_ sender: UIButton) {
        guard let inputText = wordInputTextField.text,
              inputText.isEmpty == false else {
            return
        }
       // indicatorOfDownloading.isHidden = false
        
        translationViewModel.transformTranslationToLanguage(text: inputText, targetLanguage: translationViewModel.appState.targetLanguage, sourceLanguage: translationViewModel.appState.sourceLanguage)
        
       // indicatorOfDownloading.startAnimating()

        
    }
    
    @IBAction func historyClicked(_ sender: UIButton) {
        performSegue(withIdentifier: translationViewModel.constants.identifierToHistory, sender: nil)
    }
    
    @IBAction func gameClicked(_ sender: UIButton) {
        performSegue(withIdentifier: translationViewModel.constants.identifierToGame, sender: nil)
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
        
    }
    
    func setValuesForOutlets(text: String) {
        self.translationLabel.text = text
       // self.indicatorOfDownloading.stopAnimating()
       // self.indicatorOfDownloading.isHidden = true

    }
    
    func setValuesOfWordsDependingOnLanguages() {
        // Assignment for this variable made for right saving words (english words in one group, russian words in enother group)
        var word1 = String()
        var word2 = String()
        
        if translationViewModel.appState.targetLanguage == .russian {
            word1 = self.wordInputTextField.text ?? ""
            word2  = self.translationLabel.text ?? ""
        } else {
            word1 = self.translationLabel.text ?? ""
            word2 = self.wordInputTextField.text ?? ""
        }
        translationViewModel.createRecord(word1: word1, word2: word2)
    }
    // ref name
    // startStopAnimating
    func isLoadingInProgress(loading: Bool) {
        indicatorOfDownloading.isHidden = translationViewModel.isIndicatorOfDownloadingHidden
        indicatorOfDownloading.isHidden ? indicatorOfDownloading.stopAnimating() : indicatorOfDownloading.startAnimating()
         
    }
}

