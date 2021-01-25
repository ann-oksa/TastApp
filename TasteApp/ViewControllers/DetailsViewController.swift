//
//  DetailsViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 12.01.2021.
//

import UIKit

class DetailsViewController: UIViewController, DetailsDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var word1Textfield: UITextField!
    @IBOutlet weak var word2Textfield: UITextField!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    var detailsViewModel = DetailsViewModel(newChosenRecord: Record(word1: "", word2: ""))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        word1Textfield.delegate = self
        word2Textfield.delegate = self
        detailsViewModel.delegate = self
        detailsViewModel.fillTextfieldsInFirstDownloading()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        detailsViewModel.wordOneAndTwoDidChanged(word1: word1Textfield.text, word2: word2Textfield.text)
    }
    
    @IBAction func saveChangesClicked(_ sender: UIButton) {
        detailsViewModel.saveChangesWithButtonClicked()
        self.performSegue(withIdentifier: detailsViewModel.constants.unwindSegueFromDetailsToHistory, sender: self)
        print(detailsViewModel.wordOne)
    }
    
    func fillTextfieldsWithWords(word1: String, word2: String) {
        word1Textfield.text = word1
        word2Textfield.text = word2
    }
    
}
