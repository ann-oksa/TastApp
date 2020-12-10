//
//  History.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 07.12.2020.
//

import Foundation



class Record {
    var word1: String
    var word2: String
    
    init(word1: String, word2: String) {
        self.word1 = word1
        self.word2 = word2
    }
    
}

class History {
   
    
    var journal: [Record] = []
    
    func createRecordInHistory(w1: String, w2: String) {
        var r = Record(word1: w1, word2: w2)
        addRecordToHistory(rec: r)
        print("History createRecordInHistory r: \(r)")
    }
   
    func addRecordToHistory(rec: Record) {
        journal.append(rec)
        print("History addRecordToHistory journal \(journal)")
    }
    
    func showWord() -> String {
        var index = 0
        var word = journal[index].word1
        index += 1
        print("History showWord  word: \(word)")
        
        return word
    }
    
    func showTrans() -> String {
        var index = 0
        var word = journal[index].word2
        index += 1
        print("History showTrans  word: \(word)")
        return word
    }
    
}
