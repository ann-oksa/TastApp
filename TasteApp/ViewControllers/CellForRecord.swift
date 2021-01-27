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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(_ viewModel: CellForRecordViewModel) {
        wordLabel.text = viewModel.leftWord
        translationLabel.text = viewModel.rightWord
    }
}
