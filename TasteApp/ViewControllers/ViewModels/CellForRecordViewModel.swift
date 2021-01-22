//
//  CellForRecordViewModel.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 21.01.2021.
//

import Foundation

class CellForRecordViewModel {
    
    var leftWord = String()
    var rightWord = String()
    
    func configure(record: Record, isEnglishLanguageOnLeftSide: Bool) {
        if isEnglishLanguageOnLeftSide {
            leftWord = record.word1
            rightWord = record.word2
        } else {
            leftWord = record.word2
            rightWord = record.word1
        }
    }
}
