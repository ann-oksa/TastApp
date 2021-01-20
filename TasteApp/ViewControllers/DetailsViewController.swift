//
//  DetailsViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 12.01.2021.
//

import UIKit

class DetailsViewController: UIViewController, DetailsDelegate {
    
    @IBOutlet weak var word1Textfield: UITextField!
    @IBOutlet weak var word2Textfield: UITextField!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    var chosenRecord : Record?
    let detailsViewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsViewModel.delegate = self
        detailsViewModel.fillTextfieldsInFirstDownloading(withRecord: chosenRecord ?? Record(word1: "", word2: ""))
        
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func saveChangesClicked(_ sender: UIButton) {
        
        detailsViewModel.saveChangesWithButtonClicked()
        
        
        self.performSegue(withIdentifier: detailsViewModel.constants.unwindSegueFromDetailsToHistory, sender: self)
        
        
    }
    
    func fillTextfieldsWithWords(word1: String, word2: String) {
        word1Textfield.text = word1
        word2Textfield.text = word2
    }
    
    func saveChanges() {
        detailsViewModel.shared.history.saveChangesInHistory(word1: word1Textfield.text ?? "",
                                                             word2: word2Textfield.text ?? "",
                                                             record: chosenRecord ?? Record(word1: "", word2: ""))
    }
    
    
}
