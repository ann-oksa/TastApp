//
//  TableViewCell.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 02.12.2020.
//

import UIKit

class CellForRecord: UITableViewCell {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    
    var VM : CellForRecordViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fill()
    }
    
    
    func fill() {
        wordLabel.text = VM?.leftWord
        translationLabel.text = VM?.rightWord
        print(wordLabel.text)
    }
}
