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
        for record in listOfCellViewModel {
            record.configure(isEnglishLanguageOnLeftSide: switchingStateOfLanguages)
        }
    }
    
    func removeChosenRecord(rec: Record) {
        print("InRemoveChosenRecord")
     //   appState.history.removeRecordFromHistory(record: records[indexPath.row]) //recvm.rec
      //            self.historyViewModel.records = historyViewModel.appState.getRecords()
        appState.history.removeRecordFromHistory(record: rec)
        self.records = appState.getRecords()
        print("OutRemoveChosenRecord")
    }
    
    func selectRowToGo(indexPath: IndexPath) {
        chosenRecord = listOfCellViewModel[indexPath.row].rec
    }
    
    func sortDictionary(method: KindOfSorting) {
        switch method {
        case .fromAtoZ: listOfCellViewModel.sort(by: {$1.leftWord > $0.leftWord})
        case .fromZtoA: listOfCellViewModel.sort(by: {$1.leftWord < $0.leftWord})
        case .earliest: listOfCellViewModel.sort(by: {$1.rec.date > $0.rec.date})
        case .latest: listOfCellViewModel.sort(by: {$1.rec.date < $0.rec.date})
        }
        print(listOfCellViewModel.first?.leftWord)
    }
}
