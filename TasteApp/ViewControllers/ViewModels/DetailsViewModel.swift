//
//  DetailsViewModel.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 20.01.2021.
//

import Foundation

protocol DetailsDelegate: class {
    func fillTextfieldsWithWords(word1: String, word2: String)
    func saveChanges()
    
}

class DetailsViewModel {
    
   // var chosenRecord : Record?
    var shared = AppState.shared
    let constants = IdentifiersForSegue()
    
    weak var delegate: DetailsDelegate?
    
    
    func fillTextfieldsInFirstDownloading(withRecord: Record) {
        delegate?.fillTextfieldsWithWords(word1: withRecord.word1, word2: withRecord.word2)
    }
    
    func saveChangesWithButtonClicked() {
        delegate?.saveChanges()
    }
    
    
}
