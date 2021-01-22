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
    
    let cellForRecordViewModel = CellForRecordViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func fill(record: Record, isEnglishLanguageOnLeftSide: Bool) {
        cellForRecordViewModel.configure(record: record, isEnglishLanguageOnLeftSide: isEnglishLanguageOnLeftSide)
        wordLabel.text = cellForRecordViewModel.leftWord
        translationLabel.text = cellForRecordViewModel.rightWord
    }
    
}
