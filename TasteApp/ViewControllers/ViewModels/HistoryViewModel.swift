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
           
        }
       
        
    }
    
    
    func switchStateOfLanguage() {
        switchingStateOfLanguages = !switchingStateOfLanguages

    }
    
    func removeChosenRecord(rec: Record) {
     //   appState.history.removeRecordFromHistory(record: records[indexPath.row]) //recvm.rec
      //            self.historyViewModel.records = historyViewModel.appState.getRecords()
        appState.history.removeRecordFromHistory(record: rec)
        self.records = appState.getRecords()
    }
    
    func selectRowToGo(indexPath: IndexPath) {
        chosenRecord = records[indexPath.row]
    }
}
