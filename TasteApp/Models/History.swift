//
//  History.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 07.12.2020.
//

import Foundation



class Record: Codable {
    var word1: String
    var word2: String
    
    
    init(word1: String, word2: String) {
        self.word1 = word1
        self.word2 = word2
    }
    
    
    
}

class History : Codable {
   
    
    var journal: [Record] = []
    
    init() {
      self.readRecordsFromDisk()
    }
    
    func createRecordInHistory(w1: String, w2: String) {
        var r = Record(word1: w1, word2: w2)
        addRecordToHistory(rec: r)
        saveRecordsToDisk()
    }
   
    func addRecordToHistory(rec: Record) {
        journal.append(rec)

    }
    
    func saveRecordsToDisk() {
        let encoder = JSONEncoder()
        do {
        let data = try encoder.encode(journal)
            UserDefaults.standard.setValue(data, forKey: "journal")
            print("save record data \(data)")
        }
        catch {
            print("some error \(error)")
        }
    }
   
   private func readRecordsFromDisk() {
        if let data = UserDefaults.standard.data(forKey: "journal") {
            let decoder = JSONDecoder()
            do {
                let records = try decoder.decode([Record].self, from: data)
                print("read record r \(records.count)")
                journal = records
            }
            catch {
                print("error \(error)")
            }
        }
       
    }
    
}
