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

    func fillConfigure(record: Record) {
        wordLabel.text = record.word1
        translationLabel.text = record.word2
    }

}
