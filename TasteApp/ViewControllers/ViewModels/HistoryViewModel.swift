//
//  HistoryViewModel.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 18.01.2021.
//

import Foundation


class  HistoryViewModel {

    var appState = AppState.shared
    var records : [Record]
    var chosenRecord: Record?
    var switchingStateOfLanguages = true
    let constants = IdentifiersForSegue()
    
    var listOfCellViewModel = [CellForRecordViewModel]()
    
    
    init(records:  [Record]) {
        self.records = records
        //из этого массива делаем массив CellForRecordViewModel
        
        for record in records {
            let cellVM = CellForRecordViewModel(rec: record, englishLanguageOnLeftSide: switchingStateOfLanguages)
            self.listOfCellViewModel.append(cellVM)
            print(cellVM.rightWord)
        }
        print(listOfCellViewModel.count)
        
    }
    
    
    func switchStateOfLanguage() {
        switchingStateOfLanguages = !switchingStateOfLanguages

    }
}
