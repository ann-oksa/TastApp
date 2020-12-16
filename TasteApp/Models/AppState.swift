//
//  Singletone.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 09.12.2020.
//

import Foundation

class AppState {
  
   static let shared = AppState()
    
    let history : History
    var targetLanguage: Language = .russian
    var sourceLanguage: Language = .english
    var formater = Formater()
    let sorting = Sorting()
    
    private init() {
        history = History()
    }
    
    func changeLanguageDependingOnTheIndex(index: Int) {
       
        if index == 0 {
            targetLanguage = .russian
            sourceLanguage = .english
        } else {
            targetLanguage = .english
            sourceLanguage = .russian
        }
    }
    
    func getRecords() -> [Record] {
        return history.journal
    }
    
    func createRecord(word1: String, word2: String) {
        history.createRecordInHistory(w1: word1, w2: word2)
        formater.convertCurrentDateToString()
    }
    
    
    
    
   
}
