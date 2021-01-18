//
//  HistoryViewModel.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 18.01.2021.
//

import Foundation

class  HistoryViewModel {
    
    var appState = AppState.shared
    var records : [Record] = AppState.shared.getRecords()
    var chosenRecord: Record?
    var switchingStateOfLanguages = true
    let constants = IdentifiersForSegue()
    
    
    func switchStateOfLanguage() {
        switchingStateOfLanguages = !switchingStateOfLanguages

    }
    
    
}
