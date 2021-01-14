//
//  DetailsViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 12.01.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var word1Textfield: UITextField!
    @IBOutlet weak var word2Textfield: UITextField!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    var chosenRecord : Record?
    var shared = AppState.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        word1Textfield.text = chosenRecord?.word1
        word2Textfield.text = chosenRecord?.word2
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func saveChangesClicked(_ sender: UIButton) {
        shared.history.saveChangesInHistory(word1: word1Textfield.text ?? "", word2: word2Textfield.text ?? "", record: chosenRecord!)
        self.performSegue(withIdentifier: "unwindToHistory", sender: self)
        
        
    }
    
    
}
