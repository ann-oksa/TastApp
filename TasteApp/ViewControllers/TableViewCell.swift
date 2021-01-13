//
//  TableViewCell.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 02.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func fillConfigure(record: Record, isEngLanguagesOnLeftSide: Bool) {
        
        var leftWord : String
        var rightWord : String
        
        if isEngLanguagesOnLeftSide {
            leftWord = record.word1
            rightWord = record.word2
        } else {
            leftWord = record.word2
            rightWord = record.word1
        }
        
        wordLabel.text = leftWord
        translationLabel.text = rightWord
    }
    
}
