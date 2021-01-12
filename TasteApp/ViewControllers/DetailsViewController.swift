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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveChangesClicked(_ sender: UIButton) {
        
    }
    

}
